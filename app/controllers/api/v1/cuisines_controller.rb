class Api::V1::CuisinesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]

  # GET /cuisines
  def index
    render json: Cuisine.all
  end

  # GET /cuisines/1
  def show
    render json: @cuisine if @cuisine.present?
  end

  def create
    @cuisine = Cuisine.create!(cuisine_params)
    render json: @cuisine, status: :created
  end

  # PATCH/PUT /cuisines/1
  def update
    @cuisine.update!(cuisine_params)
    render json: @cuisine
  end

  # DELETE /cuisines/1
  def destroy
    @cuisine.destroy
    head(:no_content)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cuisine_params
    params.permit(:name)
  end
end
