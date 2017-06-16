# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Poll.delete_all
Question.delete_all
AnswerChoice.delete_all
Response.delete_all

user1 = User.create(user_name:"Hui")
user2 = User.create(user_name:"Atom")
user3 = User.create(user_name:"Alice")
user4 = User.create(user_name:"David")

poll1 = Poll.create!(title: "poll1", user_id: user2.id)
poll2 = Poll.create!(title: "poll2", user_id: user1.id)
poll3 = Poll.create!(title: "poll3", user_id: user4.id)

question1 = Question.create(text:"Do you like fruit?",poll_id: poll1.id)
question2 = Question.create(text:"Do you like coding?",poll_id: poll1.id)
question3 = Question.create(text:"What's green and has wheels?",poll_id: poll2.id)

answer1 = AnswerChoice.create(text: "Yes", question_id: question1.id)
answer2 = AnswerChoice.create(text: "No", question_id: question1.id)
answer3 = AnswerChoice.create(text: "Yes", question_id: question2.id)
answer4 = AnswerChoice.create(text: "No", question_id: question2.id)
answer5 = AnswerChoice.create(text: "Grass, just kidding about the wheels", question_id: question3.id)
answer6 = AnswerChoice.create(text: "Garbage truck", question_id: question3.id)
answer7 = AnswerChoice.create(text: "I don't know!", question_id: question3.id)

response1 = Response.create(user_id: user1.id, answer_choice_id: answer1.id)
response3 = Response.create(user_id: user3.id, answer_choice_id: answer1.id)
response4 = Response.create(user_id: user4.id, answer_choice_id: answer2.id)
response5 = Response.create(user_id: user2.id, answer_choice_id: answer2.id)
response2 = Response.create(user_id: user2.id, answer_choice_id: answer5.id)
