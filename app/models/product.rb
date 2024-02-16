# frozen_string_literal: true

class Product < ApplicationRecord
  enum :product_type, %i[dish basic]

  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true
  validates :available_units, presence: true
  validates :mesured, presence: true, length: { minimum: 2, maximum: 5 },
                      acceptance: { accept: %w[kg lb lt gr units] }
  validates :product_type, presence: true
end
