class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(%i[user foods]).where(public: true)
  end
end
