# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Products', type: :request do
  describe 'GET /products' do
    before do
      get api_v1_products_path
    end
    context 'Without products' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)).to eq([]) }
    end

    context 'With products' do
      let!(:products) { create_list(:product, 2) }
      before do
        get api_v1_products_path
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body).length).to eq(2) }
    end
  end

  describe 'POST /products' do
  end
end
