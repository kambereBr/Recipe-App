class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food was successfully created.'
    else
      render :new, notice: 'Please try again'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
