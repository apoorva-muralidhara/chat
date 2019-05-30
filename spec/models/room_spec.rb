require 'rails_helper'

RSpec.describe Room do
  let(:name) { 'action_cable_enthusiasts' }

  subject(:room) { create(:room, name: name) }

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
