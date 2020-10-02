# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Pasha' }, { name: 'Sasha' }])

categories = Category.create!([
  { title: 'History' },
  { title: 'Maths' }])

test = Test.create!(title: 'Addition', level: 0, category: categories[1], author: users[0])
questions = Question.create!([
  { body: '2+2=', test: test },
  { body: '5+5=', test: test }])
Answer.create!([
  { body: '1', correct: false, question: questions[0] },
  { body: '2', correct: false, question: questions[0] },
  { body: '3', correct: false, question: questions[0] },
  { body: '4', correct: true, question: questions[0] }])
Answer.create!([
  { body: '1', correct: false, question: questions[1] },
  { body: '4', correct: false, question: questions[1] },
  { body: '5', correct: false, question: questions[1] },
  { body: '10', correct: true, question: questions[1] }])