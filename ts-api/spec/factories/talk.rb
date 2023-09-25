FactoryBot.define do
  factory :talk do
    description { Faker::Lorem.paragraph }
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    duration { Faker::Number.between(from: 1, to: 60) }
    track_id { FactoryBot.create(:track).id }
  end
end
