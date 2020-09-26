# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{ name: 'Pasha' }, { name: 'Sasha' }])

categories = Category.create!([
  { title: 'History' },
  { title: 'Maths' }])

test = Test.create!(title: 'Addition', level: 0, category_id: categories[1].id)
questions = Question.create!([
  { body: '2+2=', test_id: test.id },
  { body: '5+5=', test_id: test.id }])
Answer.create!([
  { body: '1', correct: false, question_id: questions[0].id },
  { body: '2', correct: false, question_id: questions[0].id },
  { body: '3', correct: false, question_id: questions[0].id },
  { body: '4', correct: true, question_id: questions[0].id }])
Answer.create!([
  { body: '1', correct: false, question_id: questions[1].id },
  { body: '4', correct: false, question_id: questions[1].id },
  { body: '5', correct: false, question_id: questions[1].id },
  { body: '10', correct: true, question_id: questions[1].id }])