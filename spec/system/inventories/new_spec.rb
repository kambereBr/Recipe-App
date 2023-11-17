require 'rails_helper'

RSpec.describe 'Integration test for inventories new page', type: :system do
  before(:each) do
    driven_by(:rack_test)
    # create user and log in
    visit new_user_registration_path
    fill_in 'Name', with: 'Tom'
    fill_in 'Email', with: 'example@emailprovider.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  describe 'check for the things in the page' do
    it 'has a form name input' do
      visit new_inventory_path
      expect(page).to have_field('Name')
    end

    it 'has a form submit button' do
      visit new_inventory_path
      expect(page).to have_button('Create Inventory')
    end
  end

  describe 'check for other features in the page' do
    it 'can add a new inventory' do
      visit inventories_path
      click_link('New inventory')
      fill_in 'Name', with: 'Inv 1'
      click_button 'Create Inventory'
      expect(page).to have_content('Inv 1')
      Inventory.last.destroy
    end
  end
end
