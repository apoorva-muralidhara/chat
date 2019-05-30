require 'rails_helper'

RSpec.describe RoomChannel do
  let!(:user) { create(:user, name: name, password: password) }
  let(:name) { 'Egbert' }
  let(:password) { 'topsecret' }

  context 'when there is no current user' do
    it 'rejects the subscription' do
      stub_connection current_user: nil
      subscribe
      expect(subscription).to be_rejected
    end
  end

  context 'when there is a current user' do
    it 'successfully subscribes' do
      stub_connection current_user: user
      subscribe
      expect(subscription).to be_confirmed
    end
  end
end
