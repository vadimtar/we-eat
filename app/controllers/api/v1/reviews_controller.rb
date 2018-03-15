class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  def index
    render json: Review.all
  end

  # GET /reviews/1
  def show
    render json: @review if @review.present?
    render json: { error: 'Review not found' }, status: :not_found unless @review.present?
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    head(:no_content)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.permit(:restaurant_id, :reviewer_name, :rating, :review_comment)
    end
end
