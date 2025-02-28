class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :price, :category_id, :condition_id, :image, :itemtext, :shipping_cost_id,
                                 :region_of_origin_id, :delivery_time_id).merge(user_id: current_user)
  end
end
