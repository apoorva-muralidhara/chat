require 'rails_helper'

RSpec.describe "Users" do
  describe "POST /users" do
    let(:name) { 'Egbert' }
    let(:valid_params) { { name: name, password: 'topsecret' } }
    let(:invalid_params) { { name: name } }

    before { post '/users', params: params }

    context 'when the request is valid' do
      let(:params) { valid_params }

      it 'succeeds' do
        expect(response).to have_http_status(:created)
      end

      it 'creates a new user with that name' do
        expect(User.all).to contain_exactly(have_attributes(name: name))
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end

      it "returns a success message" do
        expect(response.body).to match(/Successfully created user/)
      end
    end

    context 'when the request is invalid' do
      let(:params) { invalid_params }
      
      it 'fails' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      
      it 'does not create a new user' do
        expect(User.all).to be_empty
      end

      it 'returns JSON' do
        expect(response.content_type).to eq('application/json')
      end

      it 'returns an error message' do
        expect(response.body).to match(/Password can't be blank/)
      end
    end
  end
end
