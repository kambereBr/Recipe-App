class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    session[:recipefood] = params[:recipe]
    session[:foodrecipe] = params[:food]
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.food_id = session[:foodrecipe]
    @recipe_food.recipe_id = session[:recipefood]
    if @recipe_food.save
      redirect_to recipe_path(session[:recipefood]), notice: 'Recipe Food was successfully created.'
    else
      render :new, notice: 'Please try again'
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
