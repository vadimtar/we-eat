class Api::V1::RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    render json: Restaurant.all
  end

  # GET /restaurants/1
  def show
    render json: @restaurant if @restaurant.present?
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.create!(restaurant_params)
    render json: @restaurant, status: :created
  end

  # PATCH/PUT /restaurants/1
  def update
    @restaurant.update!(restaurant_params)
    render json: @restaurant
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    head(:no_content)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.permit(:name, :cuisine_id, :is_tenbis, :address, :maximum_delivery_time)
    end
end
