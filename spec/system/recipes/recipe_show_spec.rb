require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  describe 'recipes show page' do
    before(:each) do
      user = User.create(name: 'Ahmad', email: 'test@example.com', password: 'password')
      @recipe = Recipe.create(user:, name: 'Rice', description: 'Steps to make great one',
                              preparation_time: 60, cooking_time: 45, public: true)
      sign_in user
      visit recipe_path(@recipe)
    end

    it 'shows the correct details' do
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.description)
      expect(page).to have_content(@recipe.cooking_time)
      page.find(:css, 'input#recipe_public').should be_checked
    end

    it 'recipe interactions' do
      page.find(:css, 'input#recipe_public').set(false)
      page.find(:css, 'input.update').click
      page.find(:css, 'input#recipe_public').should_not be_checked
    end
  end
end
