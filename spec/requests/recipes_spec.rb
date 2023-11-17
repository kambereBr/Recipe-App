require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let!(:user) do
    User.create(name: 'bruno', email: 'brunokambere@gmail.com', password: '123456')
  end
  let!(:recipe) do
    Recipe.create(name: 'recipe data', preparation_time: 2.5, cooking_time: 3.5,
                  description: 'this is my description', public: true, user_id: user.id)
  end
  before do
    sign_in user
    get '/recipes'
  end
  describe 'Recipe GET/ index ' do
    it 'returns recipe http success' do
      expect(response).to have_http_status(200)
    end
    it 'renders recipe template' do
      expect(response).to render_template(:index)
    end
  end

  describe "recipes GET /show'" do
    before do
      sign_in user
      get "/recipes/#{recipe.id}"
    end

    it 'returns success for detail recipe' do
      expect(response).not_to have_http_status(400)
    end

    it 'returns success for detail recipe' do
      expect(response).to have_http_status(200)
    end
  end
end
