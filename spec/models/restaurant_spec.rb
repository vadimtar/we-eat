require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:is_tenbis) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:maximum_delivery_time) }
  it { should validate_presence_of(:cuisine_id) }
end