require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'mandatory fields presence validation' do
    it { should validate_presence_of(:restaurant_id) }
    it { should validate_presence_of(:reviewer_name) }
    it { should validate_presence_of(:rating) }
  end

  describe 'review_count field' do
    let!(:restaurant){ create(:restaurant) }
    context 'when adding review for a restaurant' do
      it 'increments review_count of the restaurant' do
        expect{ create(:review, restaurant: restaurant) }.to change{ restaurant.reviews_count }.by(1)
      end
      it 'updates restaurant rating' do
        rating = restaurant.rating
        prev_reviews_count = restaurant.reviews_count
        review = create(:review, restaurant: restaurant)
        new_rating = ((rating * prev_reviews_count) + review.rating) / restaurant.reviews_count
        expect(restaurant.rating).to eq(new_rating)
      end
    end
    context 'when deleting review for a restaurant' do
      it 'decrements review_count of the restaurant' do
        create_list(:review, 3, restaurant: restaurant)
        Review.last.destroy
        updated_restaurant = Restaurant.find(restaurant.id)
        expect(updated_restaurant.reviews_count).to eq(restaurant.reviews_count - 1)
      end
      it 'updates restaurant rating' do
        create_list(:review, 3, restaurant: restaurant)
        old_rating = restaurant.rating
        old_reviews_count = restaurant.reviews_count
        destroyed_rating = Review.last.rating
        Review.last.destroy
        updated_restaurant = Restaurant.find(restaurant.id)
        new_rating = ((old_rating * old_reviews_count) - destroyed_rating) / updated_restaurant.reviews_count
        expect(updated_restaurant.rating).to eq(new_rating)
      end
    end
  end
end