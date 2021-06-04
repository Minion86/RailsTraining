require 'rails_helper'

describe SessionsController, type: :request do

  let (:model) { create_model }
  let (:login_url) { '/login' }
  let (:logout_url) { '/logout' }

  context 'When logging in' do
    before do
      login(model)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is missing' do
    before do
      post login_url, params: {
        model: {
          email: model.email,
          password: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

  end

  context 'When logging out' do
    it 'returns 204' do
      delete logout_url

      expect(response).to have_http_status(204)
    end
  end

end
