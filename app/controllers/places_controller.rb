class PlacesController < ApplicationController

  def index
    @places = Place.active
    render json: @places
  end

  def show
    @place = Place.find(params[:id]).decorate
    @reviews = @place.reviews
    @place.increment!(:visits)
    @near_places = Place.near([@place.latitude, @place.longitude], 20)
  end

  def new
    @place = Place.new
    @categories = Category.all
    get_current_coordinates
  end

  def create
    @place = Place.new(place_params)
    @place.save!
    flash[:success] = 'Место отправлено на модерацию'
    redirect_to place_path(@place.id)
  end

  private

    def place_params
      params.require(:place).permit(:title, :category_id, :address, :description, :latitude, :longitude, :image1, :image2, :image3).merge(rating: params[:rating])
    end
end
