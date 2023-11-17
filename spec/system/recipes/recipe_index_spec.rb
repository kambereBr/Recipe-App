require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  describe 'recipes index page' do
    before(:each) do
      user = User.create(name: 'Ahmad', email: 'test@example.com', password: 'password')
      Recipe.new(user:, name: 'Rice and peas', description: 'Steps to make great rice and peas',
                 preparation_time: 60, cooking_time: 45, public: true)
      sign_in user
      visit recipes_path
    end
    let(:recipes) { Recipe.all }
    it 'shows the correct name' do
      recipes.each do |reci|
        expect(page).to have_content(reci.name)
      end
    end

    it 'displays a link to add a recipe' do
      expect(page).to have_link('New recipe', href: new_recipe_path)
    end

    it 'shows the correct description' do
      recipes.each do |reci|
        expect(page).to have_content(reci.description)
      end
    end
  end

  describe 'Public recipes page' do
    before(:each) do
      user = User.create(name: 'Ahmad', email: 'test@example.com', password: 'password')
      Recipe.new(user:, name: 'Rice and peas', description: 'Steps to make great rice and peas',
                 preparation_time: 60, cooking_time: 45, public: true)
      sign_in user
      visit public_recipes_path
    end
    let(:recipes) { Recipe.all }
    it 'shows the correct name' do
      recipes.each do |reci|
        expect(page).to have_content(reci.name)
      end
    end

    it 'shows the correct description' do
      recipes.each do |reci|
        expect(page).to have_content(reci.description)
      end
    end
  end
end
