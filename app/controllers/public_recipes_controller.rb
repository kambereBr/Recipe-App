class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(%i[user foods]).all
  end
end
