class Api::V1::CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /cuisines
  def index
    render json: Cuisine.all
  end

  # GET /cuisines/1
  def show
    return render json: @cuisine if @cuisine.present?
    render json: { error: 'Cuisine not found' }, status: :not_found unless @cuisine.present?
  end

  # POST /cuisines
  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      render json: @cuisine, status: :created
    else
      render json: @cuisine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cuisines/1
  def update
    if @cuisine.update(cuisine_params)
      render json: @cuisine
    else
      render json: @cuisine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cuisines/1
  def destroy
    @cuisine.destroy
    head(:no_content)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cuisine
    @cuisine = Cuisine.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cuisine_params
    params.permit(:name)
  end
end
