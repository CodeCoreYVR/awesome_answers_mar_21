# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#To run this file use command: rails db:seed
Answer.destroy_all # .delete_all
Question.destroy_all

NUM_QUESTION=200

NUM_QUESTION.times do
    created_at = Faker::Date.backward(days:365 * 5)

    q=Question.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::GreekPhilosophers.quote,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at
    )
    if q.persisted?  # we can also use .valid? to check the data that is entered in db was valid or not
        q.answers= rand(0..15).times.map do
            Answer.new(body: Faker::GreekPhilosophers.quote)
        end
    end
end

questions = Question.all
answer=Answer.all

puts Cowsay.say("Generated #{questions.count} questions", :sheep)
puts Cowsay.say("Generated #{answer.count} answers", :tux)