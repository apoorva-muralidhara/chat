require 'rails_helper'

RSpec.describe User do
  it { is_expected.to have_secure_password }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to validate_presence_of(:password) }
  end

  describe '#auth_token' do
    subject(:user) { create(:user, name: name, password: password) }
    
    let(:name) { 'Egbert' }
    let(:password) { 'topsecret' }

    let(:auth_token) do
      JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
    end

    it 'returns the result of JWT encoding the user id' do
      expect(user.auth_token).to eq(auth_token)
    end
  end
end
