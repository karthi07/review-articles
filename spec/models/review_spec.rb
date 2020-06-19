require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(10).is_at_most(180) }
  end

  describe 'association' do
    it { should belong_to(:user) }
  end
end
