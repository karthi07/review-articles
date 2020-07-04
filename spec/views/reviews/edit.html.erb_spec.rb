require 'rails_helper'

RSpec.describe 'reviews/edit', type: :view do
  before(:each) do
    @user = assign(:user,
                   User.create!(fullname: 'Testuser1', username: 'test1',
                                email: 'test1@test.com', password: '123456',
                                password_confirmation: '123456'))
    @review = assign(:review, Review.create!(
                                content: 'MyString value to test', user: @user
                              ))
  end

  it 'renders the edit review form' do
    render

    assert_select 'form[action=?][method=?]', review_path(@review), 'post' do
      assert_select 'input[name=?]', 'review[content]'
    end
  end
end
