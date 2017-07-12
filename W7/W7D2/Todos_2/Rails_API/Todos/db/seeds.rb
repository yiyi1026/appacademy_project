# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.delete_all

todo1 = Todo.create(title: 't1', body: 'b1', done: false)
todo2 = Todo.create(title: 't2', body: 'b2', done: false)
todo3 = Todo.create(title: 't3', body: 'b3', done: false)
todo4 = Todo.create(title: 't4', body: 'b4', done: false)
