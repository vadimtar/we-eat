require 'rails_helper'

describe Api::V1::RestaurantsController, type: :controller do
  describe '#create' do
    context 'adding new restaurant' do
      let!(:cuisine){ create(:cuisine) }
      let(:test_restaurant){ attributes_for(:restaurant, cuisine_id: cuisine.id) }
      it 'returns json of the new restaurant' do
        post :create, params: test_restaurant
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq test_restaurant[:name]
      end
      it 'returns bad request error when not sending requested param' do
        post :create

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:bad_request)
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
    let(:restaurant) { create(:restaurant) }
    it 'returns restaurant by id' do
      get :show, params: { id: restaurant.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq restaurant.id
    end
    it 'returns not_found error for non existing restaurant' do
      get :show, params: { id: restaurant.id + 1 }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    let(:restaurant){ create(:restaurant, name: 'Old Name') }
    it 'updates restaurant and returns the updated one' do
      new_name = 'New Name'
      put :update, params: { id: restaurant.id, name: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['name']).to eq new_name
    end
    it 'returns not_found error for non existing restaurant' do
      new_name = 'New Name'
      put :update, params: { id: restaurant.id + 1, name: new_name }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe '#destroy' do
    it 'deletes the restaurant' do
      restaurant = create(:restaurant)
      expect{
        delete :destroy, params: { id: restaurant.id }
      }.to change{ Restaurant.count }.by(-1)
    end
    it 'deletes all associated reviews' do
      restaurant = create(:restaurant)
      create(:review, restaurant_id: restaurant.id)
      expect{
        delete :destroy, params: { id: restaurant.id }
      }.to change{ Review.count }.by(-1)
    end
  end
end