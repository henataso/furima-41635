class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
    @user = current_user
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      @categories = Category.all.pluck(:itemname, :category_id)
      @statuses = Item.statuses.keys.map { |status| [status.titleize, status] }
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :category_id)
  end
end
