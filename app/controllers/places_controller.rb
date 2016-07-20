class PlacesController < ApplicationController

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    render json: @places
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to map_index_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:title, :category_id, :address, :description, :visits, :user_id, :latitude, :longitude)
    end
end
