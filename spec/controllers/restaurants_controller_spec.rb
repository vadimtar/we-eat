require 'rails_helper'

describe Api::V1::RestaurantsController, type: :controller do
  describe '#create' do
    context 'adding new restaurant' do
      it 'returns json of the new restaurant' do
        cuisine = create(:cuisine)
        test_restaurant = attributes_for(:restaurant, cuisine_id: cuisine.id)
        post :create, params: test_restaurant
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq test_restaurant[:name]
      end
    end
  end
  describe '#index' do
    it 'returns all restaurants' do
      create_list(:restaurant, 3)
      get :index
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(parsed_response.count).to eq 3
    end
  end
  describe '#show' do
    before(:each) do
      @restaurant = create(:restaurant)
    end
    it 'returns restaurant by id' do
      get :show, params: { id: @restaurant.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq @restaurant.id
    end
    it 'doesnt return restaurant that does not exist' do
      get :show, params: { id: @restaurant.id + 1 }
      parsed_response = JSON.parse(response.body)
      expected_response = { 'error' => 'Restaurant not found' }

      expect(parsed_response).to eq expected_response
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    it 'updates restaurant and returns the updated one' do
      restaurant = create(:restaurant, name: 'Old Name')
      new_name = 'New Name'
      put :update, params: { id: restaurant.id, name: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['name']).to eq new_name
    end
  end
  describe '#destroy' do
    it 'deletes the restaurant' do
      restaurant = create(:restaurant)
      expect{
        delete :destroy, params: { id: restaurant.id }
      }.to change{ Restaurant.count }.by(-1)
    end
  end
end