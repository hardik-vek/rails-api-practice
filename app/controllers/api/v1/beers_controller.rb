class Api::V1::BeersController < ApplicationController
  before_action :set_api_v1_beer, only: %i[ show update destroy ]

  # GET /api/v1/beers
  def index
    @api_v1_beers = Api::V1::Beer.all

    render json: @api_v1_beers
  end

  # GET /api/v1/beers/1
  def show
    render json: @api_v1_beer
  end

  # POST /api/v1/beers
  def create
    @api_v1_beer = Api::V1::Beer.new(name: params[:name])

    if @api_v1_beer.save
      render json: @api_v1_beer, status: :created, location: @api_v1_beer
    else
      render json: @api_v1_beer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/beers/1
  def update
    if @api_v1_beer.update(api_v1_beer_params)
      render json: @api_v1_beer
    else
      render json: @api_v1_beer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/beers/1
  def destroy
    @api_v1_beer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_beer
      @api_v1_beer = Api::V1::Beer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_beer_params
      params.require(:api_v1_beer).permit(:name)
    end
end
