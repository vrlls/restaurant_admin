# frozen_string_literal: true

class Product < ApplicationRecord
  enum :product_type, %i[dish basic]

  validates :name, presence: true
  validates :unit_price, presence: true
  validates :available_units, presence: true
  validates :mesured, presence: true, length: { minimum: 2, maximum: 4 }
  validates :product_type, presence: true
end
