require 'rails_helper'

describe Api::V1::CuisinesController, type: :controller do
  describe '#create' do
    context 'adding new cuisine' do
      it 'returns json of the new cuisine' do
        cuisine_name = 'Amazing Cuisine'
        post :create, params: { name: cuisine_name }
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq cuisine_name
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
    before(:each) do
      @cuisine = create(:cuisine)
    end
    it 'returns cuisine by id' do
      get :show, params: { id: @cuisine.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq @cuisine.id
    end
    it 'doesnt return cuisine that does not exist' do
      get :show, params: { id: @cuisine.id + 1 }
      parsed_response = JSON.parse(response.body)

      expected_response = { 'error' => 'Cuisine not found' }
      expect(parsed_response).to eq expected_response
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    it 'updates cuisine and returns the updated one' do
      cuisine = create(:cuisine, name: 'Old Name')
      new_name = 'New Name'
      put :update, params: { id: cuisine.id, name: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['name']).to eq new_name
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