class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user, :foods]).all
  end
end
