require 'rails_helper'

RSpec.describe 'Integration test for inventories show page', type: :system do
  before(:each) do
    driven_by(:rack_test)
    # create user and log in
    visit new_user_registration_path
    fill_in 'Name', with: 'Tom'
    fill_in 'Email', with: 'example@emailprovider.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    Inventory.create(name: 'Inv 1', user: User.find_by(name: 'Tom'))
  end

  describe 'check for the things in the page' do
    it 'has the inventory information' do
      visit inventory_path(Inventory.last)
      expect(page).to have_content('Inv 1')
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Actions')
    end
  end

  describe 'check for other features in the page' do
    it 'has a button to add a new food' do
      visit inventory_path(Inventory.last)
      expect(page).to have_link('Add food')
    end
  end
end
