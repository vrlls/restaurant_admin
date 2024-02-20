# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    before do
      @product = create(:product)
    end
    subject { @product }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:available_units) }
    it { should validate_presence_of(:product_type) }
    it { should validate_presence_of(:measure) }

    it do
      should define_enum_for(:product_type)
        .with_values(%i[dish basic])
    end

    it { should validate_uniqueness_of(:name) }

    it { expect(subject).to validate_inclusion_of(:measure).in_array(%w(kg lb lt gr units)) }

  end
end
