FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence(word_count: 10) }
    body { Faker::Lorem.paragraph_by_chars(number: 512, supplemental: false) }
    trait :invalid do
      title { '' }
      body { '' }
    end
  end
end
