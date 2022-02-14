FactoryBot.define do
  factory :order_address do
    postcode { "123-1234" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { "練馬区" }
    block { "練馬1-1-1" }
    building { "練馬ビル" }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
  end
end
