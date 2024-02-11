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
    context 'With valid params' do
      before do
        post api_v1_products_path({ product: { name: 'Gulash', unit_price: 12_000, available_units: 5, mesured: 'units', product_type: :dish } })
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(Product.last.name).to eq('Gulash') }
      it { expect(Product.last.dish?).to eq(true) }
    end

    context 'With invalid params' do
      before do
        post api_v1_products_path({ product: { name: nil, available_units: 5, mesured: 'lb' } })
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(JSON.parse(response.body)['message']).to eq('Error creating product') }
    end
  end

  describe 'GET /product' do
    context 'Valid product' do
      let!(:product) { create(:product) }
      before do
        get api_v1_product_path({ id: product.id })
      end
      it { expect(response).to have_http_status(:found) }
      it { expect(JSON.parse(response.body)['name']).to eq(product.name) }
    end

    context 'Invalid product' do
      let!(:product) { create(:product) }
      before do
        get api_v1_product_path({ id: 123 })
      end
      it { expect(response).to have_http_status(:not_found) }
    end
  end
end
