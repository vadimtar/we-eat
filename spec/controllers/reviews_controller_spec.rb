require 'rails_helper'

describe Api::V1::ReviewsController, type: :controller do
  describe '#create' do
    context 'adding new review' do
      it 'returns json of the new review' do
        restaurant = create(:restaurant)
        test_review = attributes_for(:review, restaurant_id: restaurant.id)
        post :create, params: test_review
        JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
      end
    end
  end
  describe '#index' do
    it 'returns all reviews' do
      create_list(:review, 3)
      get :index
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(parsed_response.count).to eq 3
    end
  end
  describe '#show' do
    before(:each) do
      @review = create(:review)
    end
    it 'returns review by id' do
      get :show, params: { id: @review.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq @review.id
    end
    it 'doesnt return review that does not exist' do
      get :show, params: { id: @review.id + 1 }
      parsed_response = JSON.parse(response.body)

      expected_response = { 'error' => 'Review not found' }
      expect(parsed_response).to eq expected_response
      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    it 'updates review and returns the updated one' do
      review = create(:review, review_comment: 'Old Name')
      new_name = 'New Name'
      put :update, params: { id: review.id, review_comment: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['review_comment']).to eq new_name
    end
  end
  describe '#destroy' do
    it 'deletes the review' do
      review = create(:review)
      expect{
        delete :destroy, params: { id: review.id }
      }.to change{ Review.count }.by(-1)
    end
  end
end