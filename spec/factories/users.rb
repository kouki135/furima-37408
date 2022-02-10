FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '亜意卯' }
    first_name            { '絵尾' }
    last_name_kana        { 'アイウ' }
    first_name_kana       { 'エオ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
