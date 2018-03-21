require 'rails_helper'

describe Api::V1::ReviewsController, type: :controller do
  describe '#create' do
    context 'adding new review' do
      let!(:restaurant){ create(:restaurant) }
      let(:test_review){ attributes_for(:review, restaurant_id: restaurant.id) }
      it 'returns json of the new review' do
        post :create, params: test_review
        JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
      end
    end
    it 'returns bad request error when not sending requested param' do
      post :create

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:bad_request)
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
    let(:review) { create(:review) }
    it 'returns review by id' do
      get :show, params: { id: review.id }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['id']).to eq review.id
    end
    it 'returns not_found error for non existing review' do
      get :show, params: { id: review.id + 1 }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
    end
  end
  describe 'update' do
    let(:review){ create(:review, review_comment: 'Old Name') }
    it 'updates review and returns the updated one' do
      new_name = 'New Name'
      put :update, params: { id: review.id, review_comment: new_name }
      parsed_response = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(parsed_response['review_comment']).to eq new_name
    end
    it 'returns not_found error for non existing review' do
      new_name = 'New Name'
      put :update, params: { id: review.id + 1, name: new_name }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:not_found)
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