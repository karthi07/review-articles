FactoryBot.define do
  factory :user do
    username { 'test123' }
    fullname { 'test user 123' }
    email { 'test123@test.com' }
    password { '123456' }
  end
end
