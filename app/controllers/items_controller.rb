class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, notice: 'Item was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: 'Item was successfully daleted'
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :price, :category_id, :condition_id, :image, :itemtext, :shipping_cost_id,
                                 :region_of_origin_id, :delivery_time_id).merge(user_id: current_user.id)
  end

  def check_owner
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path, alert: 'You are not authorized to edit this item.'
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
