# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.all
        render json: @products, status: :ok
      end

      def show
        render json: product, status: :found
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Product not founded' }, status: :not_found
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created
        else
          render json: { message: 'Error creating product' }, status: :unprocessable_entity
        end
      end

      def update
        if product.update(product_params)
          render json: product, status: :ok
        else
          render json: { message: 'Error updating product' }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Product not founded' }, status: :not_found
      end

      def destroy
        if product.destroy
          render json: {message: "Product destroyed successfully"}, status: :ok
        else
          render json: {message: "Error destruying product"}, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Product not founded' }, status: :not_found
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :unit_price, :available_units,
                                        :mesured, :product_type)
      end

      def product
        Product.find(params[:id])
      end
    end
  end
end
