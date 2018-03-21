require 'rails_helper'

describe Api::V1::CuisinesController, type: :controller do
  describe '#create' do
    context 'adding new cuisine' do
      let(:cuisine) { attributes_for(:cuisine) }
      it 'returns json of the new cuisine' do
        post :create, params: cuisine
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq cuisine[:name]
      end
      it 'returns bad request error when not sending requested param' do
        post :create

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
  describe '#index' do
    it 'returns all cuisines' do
      create_list(:cuisine, 3)
      get :index
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(parsed_response.count).to eq 3
    end
  end
  describe '#show' do
    let(:cuisine) { create(:cuisine) }
    it 'returns cuisine by id' do
      get :show, params: { id: cuisine.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq cuisine.id
    end
    it 'returns not_found error for non existing cuisine' do
      get :show, params: { id: cuisine.id + 1 }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    let(:cuisine){ create(:cuisine, name: 'Old Name') }
    it 'updates cuisine and returns the updated one' do
      new_name = 'New Name'
      put :update, params: { id: cuisine.id, name: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['name']).to eq new_name
    end
    it 'returns not_found error for non existing cuisine' do
      new_name = 'New Name'
      put :update, params: { id: cuisine.id + 1, name: new_name }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe '#destroy' do
    before(:example) do
      @cuisine = create(:cuisine)
    end
    it 'deletes the cuisine' do
      expect{
        delete :destroy, params: { id: @cuisine.id }
      }.to change{ Cuisine.count }.by(-1)
    end
  end
end