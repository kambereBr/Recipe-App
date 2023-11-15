class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    if params.key?(:recipe)
      @recipe = Recipe.find(params[:recipe])
      session[:recipe] = @recipe.id
    end
    return unless params.key?(:inventory)

    @inventory = Inventory.find(params[:inventory])
    session[:inventory] = @inventory.id
  end

  def create
    @food = Food.new(food_params)
    if session[:recipe].nil? and !session[:inventory].nil?
      (@inventory = session[:inventory]
       if @food.save
         redirect_to new_inventory_food_path(food: @food, inventory: @inventory),
                     notice: 'Food was successfully created.'
         session[:inventory] = nil
       else
         render :new, notice: 'Please try again'
       end)
    elsif session[:inventory].nil? and !session[:recipe].nil?
      (
        @recipe = session[:recipe]
        if @food.save
          redirect_to new_recipe_food_path(food: @food, recipe: @recipe), notice: 'Food was successfully created.'
          session[:recipe] = nil
        else
          render :new, notice: 'Please try again'
        end)
    elsif @food.save
      redirect_to foods_path,
                  notice: 'Food was successfully created.'

    else
      render :new, notice: 'Please try again'
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      if @food.inventories.length.positive?
        (redirect_to inventories_path, notice: 'Food was successfully updated.')
      else
        (redirect_to recipes_path, notice: 'Food was successfully updated.')
      end
    else
      render :edit, status: :unprocessable_entity

    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to request.referer, notice: 'Food destroyed successfully'
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
