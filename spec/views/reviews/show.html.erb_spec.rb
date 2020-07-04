require 'rails_helper'

RSpec.describe 'reviews/show', type: :view do
  before(:each) do
    @user = assign(:user,
                   User.create!(fullname: 'Testuser1', username: 'test1',
                                email: 'test1@test.com', password: '123456',
                                password_confirmation: '123456'))
    @review = assign(:review, Review.create!(
                                content: 'Content for review testing', user: @user
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Content/)
  end
end
