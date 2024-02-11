# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:available_units) }
    it { should validate_presence_of(:product_type) }
    it { should validate_presence_of(:mesured) }

    it { should validate_length_of(:mesured).is_at_least(2) }
    it { should validate_length_of(:mesured).is_at_most(5) }

    it do
      should define_enum_for(:product_type)
        .with_values(%i[dish basic])
    end
  end
end
