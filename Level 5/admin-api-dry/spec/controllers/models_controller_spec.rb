require 'rails_helper'

describe ModelController, type: :request do

  let (:models) { create_model }

  context 'When fetching a model' do
    before do
      login_with_api(model)
      get "/models/#{model.id}", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns the model' do
      expect(json['data']).to have_id(model.id.to_s)
      expect(json['data']).to have_type('models')
    end
  end

  context 'When a model is missing' do
    before do
      login_with_api(model)
      get "/models/blank", headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 404' do
      expect(response.status).to eq(404)
    end
  end

  context 'When the Authorization header is missing' do
    before do
      get "/models/#{user.id}"
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end
  end

end
