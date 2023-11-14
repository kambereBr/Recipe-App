class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.preparation_time = @recipe.preparation_time.to_i
    @recipe.cooking_time = @recipe.cooking_time.to_i
    @recipe.public ||= false

    if @recipe.save!
      redirect_to recipes_path, notice: 'Recipe created successfully'
    else
      render :new, notice: 'Please try again, an error occured'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    return unless @recipe.destroy!

    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
