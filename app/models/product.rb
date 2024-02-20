# frozen_string_literal: true

class Product < ApplicationRecord
  enum :product_type, %i[dish basic]

  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true
  validates :available_units, presence: true
  validates :measure, inclusion: { in: %w(kg lb lt gr units), message: "is not included in the list" }, presence: true
  validates :product_type, presence: true
end
