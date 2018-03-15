class Api::V1::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /restaurants
  def index
    render json: Restaurant.all
  end

  # GET /restaurants/1
  def show
    return render json: @restaurant if @restaurant.present?
    render json: { error: 'Restaurant not found' }, status: :not_found unless @restaurant.present?
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: @restaurant, status: :created
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    head(:no_content)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.permit(:name, :cuisine_id, :rating, :is_tenbis, :address, :maximum_delivery_time)
    end
end
