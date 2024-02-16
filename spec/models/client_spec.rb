# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'Validations' do
    context 'Presence' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:address) }
      it { should validate_presence_of(:phone) }
    end

    context 'Length' do
      it { should validate_length_of(:name).is_at_least(3) }
      it { should validate_length_of(:name).is_at_most(20) }

      it { should validate_length_of(:last_name).is_at_least(3) }
      it { should validate_length_of(:last_name).is_at_most(30) }

      it { should validate_length_of(:address).is_at_least(3) }
      it { should validate_length_of(:address).is_at_most(250) }

      it { should validate_length_of(:phone).is_at_least(7) }
      it { should validate_length_of(:phone).is_at_most(30) }

      it { should validate_length_of(:email).is_at_least(4) }
      it { should validate_length_of(:email).is_at_most(254) }

      it { should validate_length_of(:notes).is_at_most(500) }
    end

    context 'Format' do
      before do
        @cliente = create(:client)
      end
      subject { @cliente }
      it { should allow_value('a@b.c').for(:email) }
      it { should_not allow_value('ab.c').for(:email) }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  end
end
