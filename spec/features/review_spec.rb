require 'rails_helper'

# rubocop:disable Metrics/BlockLength
feature 'Review actions', :js => true do
  before(:each) do
    FactoryBot.create(:user)
  end
  # rubocop:enable Metrics/BlockLength

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
    fill_in 'review_content', with: 'The test review created by rspec to test the feature\n'
    find("#review_content").send_keys(:enter)

    # find( '#review_content').set('The test review created by rspec to test\n')
  
    # click_on 'review_content'
    #document.querySelector("body > div > div.review-container.col-10.container > div > div.center-ctn.col-10 > div.reviews > div:nth-child(1) > div > form")
    # page.execute_script("$('body form').submit()")
    expect(page).to have_content 'The test review created by rspec to test the feature'
    expect(page).to have_content 'test123'
  end


end