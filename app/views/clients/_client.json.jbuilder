# frozen_string_literal: true

json.extract! client, :id, :name, :last_name, :address, :phone, :email, :notes, :created_at,
              :updated_at
json.url client_url(client, format: :json)
