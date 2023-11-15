class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe: @recipe)
    @inventories = Inventory.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path, notice: 'Food was successfully created.'
    else
      render :new, notic: 'Please try again'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    return unless @recipe.update(recipe_params)

    redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.'
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
