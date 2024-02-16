# frozen_string_literal: true
module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show update destroy]

      # GET /clients
      # GET /clients.json
      def index
        @clients = Client.all
        render json: @clients, status: :ok
      end

      # GET /clients/1
      # GET /clients/1.json
      def show
        render json: @client, status: :found
      end

      # POST /clients
      # POST /clients.json
      def create
        @client = Client.new(client_params)

        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /clients/1
      # PATCH/PUT /clients/1.json
      def update
        if @client.update(client_params)
          render json: @client, status: :ok
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      # DELETE /clients/1
      # DELETE /clients/1.json
      def destroy
        if @client.destroy
          render json: { message: 'Client destroyed successfully' }, status: :ok
        else
          render json: { message: 'Error destroying product' }, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = Client.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: 'Client not founded' }, status: :not_found
      end

      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:name, :last_name, :address, :phone, :email, :notes)
      end
    end
  end
end
