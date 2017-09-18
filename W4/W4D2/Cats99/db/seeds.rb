# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#:birth_date, :color, :name, :sex, :description


Cat.destroy_all

cat1 = Cat.create(birth_date: Date.new(2015,7,5), color: :black, name: :fluffy, sex: :F, description: :cute)
cat2 = Cat.create(birth_date: Date.new(2014,3,7), color: :white, name: :kitty, sex: :M, description: :strong)
cat3 = Cat.create(birth_date: Date.new(2016,10,2), color: :brown, name: :brownie, sex: :F, description: :mean)
cat4 = Cat.create(birth_date: Date.new(2013,1,2), color: :white, name: :snowie, sex: :M, description: :sweet)
