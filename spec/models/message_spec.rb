require 'rails_helper'

RSpec.describe Message do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:room) }
  end
end
