require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "POST /authentications" do
    let(:name) { 'Egbert' }
    let(:nonexistent_name) { 'IDoNotExistAtAll' }

    let(:password) { 'topsecret' }
    let(:wrong_password) { 'not_the_right_password' }

    let(:invalid_params) { { name: name } }

    let(:nonexistent_name_params) do
      { name: nonexistent_name, password: password }
    end

    let(:wrong_password_params) { { name: name, password: wrong_password } }

    let(:valid_params) { { name: name, password: password } }

    let!(:user) { create(:user, name: name, password: password) }

    before { post '/authentications', params: params }

    context 'when the request is invalid' do
      let(:params) { invalid_params }
      
      it 'fails' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an error message' do
        expect(json).to include('message' => 'Authentication Failed')
      end
    end

    context 'when there is no user by that name' do
      let(:params) { nonexistent_name_params }

      it 'fails' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an error message' do
        expect(json).to include('message' => 'Authentication Failed')
      end
    end

    context 'when the password is wrong' do
      let(:params) { wrong_password_params }

      it 'fails' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an error message' do
        expect(json).to include('message' => 'Authentication Failed')
      end
    end

    context 'when there is a user by that name' do
      let(:params) { valid_params }

      it 'succeeds' do
        expect(response).to have_http_status(:created)
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end
      
      it 'returns an auth token' do
        expect(json).to include('auth_token' => user.auth_token)
      end
    end

    def json
      JSON.parse(response.body)
    end
  end
end
