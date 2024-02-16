# frozen_string_literal: true

class Client < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, length: { minimum: 3, maximum: 30 }
  validates :address, presence: true, length: { minimum: 3, maximum: 250 }
  validates :notes, length: { maximum: 500 }
  validates :phone, presence: true, length: { minimum: 7, maximum: 30 }
  validates :email, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 4, maximum: 254 }
end
