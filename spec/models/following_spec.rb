require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'association' do
    it { should belong_to(:followed) }
    it { should belong_to(:follower) }
  end
end
