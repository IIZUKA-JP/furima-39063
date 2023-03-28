FactoryBot.define do
  factory :item do
    
    product_name  {Faker::Name.initials}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    price  {Faker::Number.between(from: 300, to: 9_999_999)}
    explanation {Faker::Lorem.sentence(word_count: 25)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    delivery_day_id {Faker::Number.between(from: 2, to: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    association :user


  end
end
