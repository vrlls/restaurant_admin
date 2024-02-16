# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Clients', type: :request do
  describe 'GET /clients' do
    before do
      get api_v1_clients_path
    end
    context 'Without clients' do
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)).to eq([]) }
    end

    context 'With clients' do
      let!(:clients) { create_list(:client, 2) }
      before do
        get api_v1_clients_path
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body).length).to eq(2) }
    end
  end

  describe 'POST /clients' do
    context 'With valid params' do
      before do
        post api_v1_clients_path({ client: { name: 'Luis', last_name: 'Villa', address: "Carrera 26 c 4 #79 a - 08", phone: '+57 3046028893', email: "sebas@email.com" } })
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(Client.last.name).to eq('Luis') }
    end

    context 'With invalid params' do
      before do
        post api_v1_clients_path({ client: { name: 'Luis', address: "Carrera 26 c 4 #79 a - 08", email: 'baemail.com'} })
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'GET /client' do
    context 'Valid client' do
      let!(:client) { create(:client) }
      before do
        get api_v1_client_path({ id: client.id })
      end
      it { expect(response).to have_http_status(:found) }
      it { expect(JSON.parse(response.body)['name']).to eq(client.name) }
    end

    context 'Invalid client' do
      let!(:client) { create(:client) }
      before do
        get api_v1_client_path({ id: 123 })
      end
      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'PATCH /client' do
    context 'With existing client and valid params' do
      let!(:client) { create(:client) }
      before do
        put api_v1_client_path({ id: client.id, client: { name: 'new name' } })
      end
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['name']).to eq('new name') }
    end

    context 'with non-existent client and valid params' do
      let!(:client) { create(:client) }
      before do
        put api_v1_client_path({ id: 123, client: { name: 'new name' } })
      end
      it { expect(response).to have_http_status(:not_found) }
    end

    context 'With existing client and invalid params' do
      let!(:client) { create(:client) }
      before do
        put api_v1_client_path({ id: client.id, client: { name: nil } })
      end
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'DELETE /clients' do
    context 'With existing client' do
      let!(:client) { create(:client) }
      before do
        delete api_v1_client_path({ id: client.id })
      end

      it { expect(response).to have_http_status(:ok) }
    end

    context 'with non-existent clients' do
      let!(:client) { create(:client) }
      before do
        delete api_v1_client_path({ id: 123 })
      end

      it { expect(response).to have_http_status(:not_found) }
    end
  end
end

