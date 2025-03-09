class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]
  before_action :check_item_sold_out, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddressForm.new
  end

  def create
    @order_address = OrderAddressForm.new(order_address_params)
    @order_address.price = @item.price
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @errors = @order_address.errors.full_messages
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    permitted_params = params.require(:order_address_form).permit(:postal_code, :region_of_origin_id, :city, :house_number,
                                                                  :building_name, :tell, :price, :token)
    permitted_params.merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def redirect_if_seller
    return unless @item.user_id == current_user.id

    redirect_to root_path, notice: '自分の商品の購入ページにはアクセスできません。'
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @order_address.price, # 商品の値段
      card: @order_address.token, # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def check_item_sold_out
    return unless @item.sold_out? && @item.user != current_user

    redirect_to root_path, alert: 'この商品は既に売却されています。'
  end
end
