class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
