# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[edit update show destroy]
      def index
        @products = Product.all
        render json: @products, status: :ok
      end

      def show
        render json: @product, status: :found
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product, status: :ok
        else
          render json: { message: 'Error updating product' }, status: :unprocessable_entity
        end
      end

      def destroy
        if @product.destroy
          render json: { message: 'Product destroyed successfully' }, status: :ok
        else
          render json: { message: 'Error destroying product' }, status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :unit_price, :available_units,
                                        :mesured, :product_type)
      end

      def set_product
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Product not founded' }, status: :not_found
      end
    end
  end
end
