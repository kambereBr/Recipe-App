require 'test_helper'

class PublicRecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get idnex' do
    get public_recipes_idnex_url
    assert_response :success
  end
end
