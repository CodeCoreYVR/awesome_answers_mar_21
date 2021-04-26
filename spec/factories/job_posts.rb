#  Docuementation
#https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md
# 
RANDOM_HUNDRED_CHARS='Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world'

FactoryBot.define do
  factory :job_post do
    sequence(:title){|n| Faker::Job.title + "#{n}"}
    # sequence is a method provede by factory_bot which acceps a lambda injecting a varaible n. n is usually a numner the factory bot increments on every object that it generates to make all instances unique
    description {Faker::Job.field + "#{RANDOM_HUNDRED_CHARS}"}
    location{Faker::Address.city}
    company_name{Faker::Company.name}
    min_salary{rand(80_000..200_000)}
    max_salary{rand(200_000..400_000)}
  end
end

# FactoryBot.create(:job_post)
# FactoryBot.build(:job_post)
