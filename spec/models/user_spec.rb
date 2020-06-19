require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:email) }
  end

  describe 'association' do
    it { should have_many(:reviews) }
    it { should have_many(:following) }
    it { should have_many(:followers_list).through(:followers) }
    it { should have_many(:followers) }
    it { should have_many(:following_list).through(:following) }
  end
end
