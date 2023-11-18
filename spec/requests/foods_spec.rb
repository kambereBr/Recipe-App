require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let!(:user) do
    User.create(name: 'bruno', email: 'brunokambere@gmail.com', password: '123456')
  end

  describe 'GET #index' do
    context 'when user is authenticated' do
      it 'returns food http success' do
        sign_in user

        get '/foods'

        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        sign_in user

        get '/foods'

        expect(response).to render_template(:index)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        get '/foods'

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
