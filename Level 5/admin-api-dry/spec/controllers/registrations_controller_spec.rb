require 'rails_helper'

describe RegistrationsController, type: :request do

  let (:models) { build_model }
  let (:existing_model) { create_model }
  let (:create_url) { '/create' }

  context 'When creating a new model' do
    before do
      post create_url, params: {
        model: {
          email: model.email,
          password: model.password
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the model email' do
      expect(json['data']).to have_attribute(:email).with_value(model.email)
    end
  end

  context 'When an email already exists' do
    before do
      post create_url, params: {
        model: {
          email: existing_model.email,
          password: existing_model.password
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

end
