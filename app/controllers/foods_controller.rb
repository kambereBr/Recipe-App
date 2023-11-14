class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update; end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to request.referer, notice: 'Food destroyed successfully'
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
