require 'rails_helper'

describe Api::V1::CuisinesController, type: :controller do
  describe '#create' do
    context 'adding new cuisine' do
      it 'returns json of the new cuisine' do
        cuisine_test_name = 'Test Cuisine'
        post :create, params: { name: cuisine_test_name }
        parsed_response = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
        expect(parsed_response['name']).to eq cuisine_test_name
      end
    end
  end
end