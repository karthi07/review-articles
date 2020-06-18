# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ fullname: 'Test User 1', username: 'testuser1', email: 'test1@test.com', password: '123456', password_confirmation: '123456' }, { fullname: 'Test User 2', username: 'testuser2', email: 'test2@test.com', password: '123456', password_confirmation: '123456' }, { fullname: 'Test User 3', username: 'testuser3', email: 'test3@test.com', password: '123456', password_confirmation: '123456' }, { fullname: 'Test User 4', username: 'testuser4', email: 'test4@test.com', password: '123456', password_confirmation: '123456' },{ fullname: 'Test User 5', username: 'testuser5', email: 'test5@test.com', password: '123456', password_confirmation: '123456' } ])