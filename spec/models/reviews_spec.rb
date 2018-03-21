require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:restaurant_id) }
  it { should validate_presence_of(:reviewer_name) }
  it { should validate_presence_of(:rating) }
end