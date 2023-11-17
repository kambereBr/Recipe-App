require 'rails_helper'

RSpec.describe 'Integration test for foods index page', type: :system do
  before(:each) do
    driven_by(:rack_test)
    Food.create(name: 'Limon', measurement_unit: 'kg', price: 28)
    # create user and log in
    visit new_user_registration_path
    fill_in 'Name', with: 'Tom'
    fill_in 'Email', with: 'example@emailprovider.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  describe 'check for the things in the page' do
    it 'has the food information' do
      visit foods_path
      expect(page).to have_content('Limon')
      expect(page).to have_content('kg')
      expect(page).to have_content('28')
    end

    it 'has the column head' do
      visit foods_path
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement_unit')
      expect(page).to have_content('Unit price')
      expect(page).to have_content('Actions')
    end
  end

  describe 'check for other features in the page' do
    it 'has a button to add a new food' do
      visit foods_path
      expect(page).to have_link('Add food')
    end

    it 'has a button to delete a food' do
      visit foods_path
      expect(page).to have_button('Remove')
    end

    it 'Deletes a food on click remove' do
      visit foods_path
      click_button('Remove')
      expect(page).not_to have_content('Tomato')
    end
  end
end
