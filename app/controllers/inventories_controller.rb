class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    if @inventory.save
      redirect_to inventories_path, notice: 'Inventory created successfully'
    else
      render :new, notice: 'Please try again'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    return unless @inventory.destroy

    redirect_to inventories_path
  end

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
