# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    notes { Faker::Lorem.sentence(word_count: 20) }
  end
end
