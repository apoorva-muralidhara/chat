require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  describe "POST /authentications" do
    let(:valid_params) { { name: name, password: 'topsecret' } }
    let(:invalid_params) { { name: name } }

    before { post '/users', params: params }

    context 'when the request is invalid' do
    end

    context 'when there is no user by that name' do
    end

    context 'when there is a user by that name' do
    end
  end
end
