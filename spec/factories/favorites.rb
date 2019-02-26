FactoryBot.define do
  factory :favorite do
    user
    text { Faker::GreekPhilosophers.quote }
    url { Faker::Internet.url }

  end
end
