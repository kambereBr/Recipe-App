require 'rails_helper'

RSpec.describe 'Integration test for foods new page', type: :system do
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

  describe 'check for the feature in the page' do
    it 'Adds a food on click add food' do
      visit foods_path
      click_link('Add food')
      fill_in 'Name', with: 'Tomato'
      fill_in 'Measurement unit', with: 'kg'
      fill_in 'Price', with: 5
      click_button 'Create Food'
      expect(page).to have_content('Tomato')
      expect(page).to have_content('kg')
      expect(page).to have_content('5')
    end
  end
end
