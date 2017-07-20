# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all

user1 = User.create!(username: 'user1', password: '123456')
user2 = User.create!(username: 'user2', password: '123456')
user3 = User.create!(username: 'user3', password: '123456')
user4 = User.create!(username: 'user4', password: '123456')
