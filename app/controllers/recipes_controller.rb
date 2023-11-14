class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show; end

  def new; end

  def create; end

  def destroy; end
end
