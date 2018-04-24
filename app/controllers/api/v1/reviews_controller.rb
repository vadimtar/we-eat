class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    render json: Review.all
  end

  def index_by_restaurant_id
    render json: Review.where(restaurant_id: review_params[:restaurant_id])
  end

  # GET /reviews/1
  def show
    render json: @review if @review.present?
  end

  # POST /reviews
  def create
    @review = Review.create!(review_params)
    render json: @review, status: :created
  end

  # PATCH/PUT /reviews/1
  def update
    @review.update!(review_params)
    render json: @review
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    head(:no_content)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.permit(:id, :restaurant_id, :reviewer_name, :rating, :review_comment)
    end
end
