require 'rails_helper'

RSpec.describe 'Integration test for inventories index page', type: :system do
  before(:each) do
    driven_by(:rack_test)
    # create user and log in
    visit new_user_registration_path
    fill_in 'Name', with: 'Tom'
    fill_in 'Email', with: 'example@emailprovider.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    # create inventory
    Inventory.create(name: 'Inv 1', user: User.find_by(name: 'Tom'))
  end

  describe 'check for the things in the page' do
    it 'has the inventory information' do
      visit inventories_path
      expect(page).to have_content('Inv 1')
      expect(page).to have_content('Lorem')
    end
  end

  describe 'check for other features in the page' do
    it 'has a button to add a new inventory' do
      visit inventories_path
      expect(page).to have_link('New inventory')
    end

    it 'has a button to delete a inventory' do
      visit inventories_path
      expect(page).to have_button('Remove')
    end

    it 'Deletes a inventory on click remove' do
      visit inventories_path
      click_button('Remove')
      expect(page).not_to have_content('Inv 1')
    end
  end
end
