# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { product_type == :dish ? Faker::Food.dish : Faker::Food.ingredient }
    unit_price { 1.5 }
    available_units { Faker::Number.number(digits: 2) }
    measure { 'units' }
    description { Faker::Food.description }
    product_type { %i[dish basic].sample }
  end
end
