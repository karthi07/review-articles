require 'rails_helper'
feature 'Review actions', js: true do
  before(:each) do
    FactoryBot.create(:user)
  end

  scenario 'Sign into website' do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'test123@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'test123'
  end

  scenario 'Sign into website with wrong credentials' do
    visit '/users/sign_out'
    visit '/'
    fill_in 'user_email', with: 'test123@test.com'
    fill_in 'user_password', with: 'wrongpassword'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Add Review' do
    visit '/users/sign_out'
    visit '/'
    fill_in 'user_email', with: 'test123@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'Log in'
    fill_in 'review_content', with: 'The test review created by rspec to test the feature'
    find('#review_content').send_keys(:enter)

    expect(page).to have_content 'The test review created by rspec to test the feature'
    expect(page).to have_content 'test123'
  end
end
