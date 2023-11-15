class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    session[:inventoryfood] = params[:inventory]
    session[:foodinventory] = params[:food]
  end

  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    @inventory_food.food_id = session[:foodinventory]
    @inventory_food.inventory_id = session[:inventoryfood]
    if @inventory_food.save
      redirect_to inventory_path(session[:inventoryfood]), notice: 'Inventory Food was successfully created.'
    else
      render :new, notice: 'Please try again'
    end
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity)
  end
end
