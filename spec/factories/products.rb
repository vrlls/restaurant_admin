# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Rice' }
    unit_price { 1.5 }
    available_units { 1 }
    mesured { 'lb' }
    description { 'premium rice' }
    product_type { 1 }
  end
end
