require 'rails_helper'

RSpec.describe ApplicationCable::Connection do
  let!(:user) { create(:user, name: name, password: password) }
  let(:name) { 'Egbert' }
  let(:password) { 'topsecret' }

  let(:nonexistent_token) { 'thisisnotatoken' }

  context 'when there is no Authorization header' do
    let(:headers) { { } }
    it 'rejects the connection' do
      expect { connect '/chat', headers: headers }.to have_rejected_connection
    end
  end

  context "when the Authorization header is not an existing user's token" do
    let(:headers) { { 'Authorization' => nonexistent_token } }
    it 'rejects the connection' do
      expect { connect '/chat', headers: headers }.to have_rejected_connection
    end
  end

  context "when the Authorization header is an existing user's token" do
    let(:headers) { { 'Authorization' => user.auth_token } }
    it 'successfully connects' do
      connect '/chat', headers: headers
      expect(connection.current_user).to eq(user)
    end
  end
end
