require 'rails_helper'

RSpec.describe Room do
  let(:name) { 'action_cable_enthusiasts' }

  subject(:room) { create(:room, name: name) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
