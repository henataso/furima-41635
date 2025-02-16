class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @user = current_user
    @categories = Category.all.map { |c| [c.name, c.id] }
    @conditions = Condition.all.map { |c| [c.name, c.id] }
    @shipping_costs = ShippingCost.all.map { |c| [c.name, c.id] }
    @regions = Region.all.map { |c| [c.name, c.id] }
    @delivery_times = DeliveryTime.all.map { |c| [c.name, c.id] }
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      @categories = Category.all.map { |c| [c.name, c.id] }
      @conditions = Condition.all.map { |c| [c.name, c.id] }
      @shipping_costs = ShippingCost.all.map { |c| [c.name, c.id] }
      @regions = Region.all.map { |c| [c.name, c.id] }
      @delivery_times = DeliveryTime.all.map { |c| [c.name, c.id] }
      flash.now[:alert] = 'There was a problem with your submission.'
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:itemname, :itemtext, :category_id, :condition_id, :shipping_cost_id, :region_of_origin_id,
                                 :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
