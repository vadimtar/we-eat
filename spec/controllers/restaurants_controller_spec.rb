require 'rails_helper'

describe Api::V1::RestaurantsController, type: :controller do
  describe '#create' do
    context 'adding new restaurant' do
      let(:cuisine) { create(:cuisine) }
      it 'returns json of the new restaurant' do
        # cuisine = create(:cuisine)
        test_restaurant = {
            name: "Big Jeff's",
            rating: 2,
            is_tenbis: 1,
            address: 'South Pasadena, CA',
            maximum_delivery_time: 30,
            cuisine_id: cuisine.id
        }
        post :create, params: test_restaurant
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq test_restaurant[:name]
      end
    end
  end
end