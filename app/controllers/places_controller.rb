class PlacesController < ApplicationController

  def index
    @places = Place.where(nil)
    filtering_params(params).each do |key, value|
      @places = @places.public_send(key, value) if value.present?
    end
    render json: @places
  end

  def show
    @place = Place.find(params[:id]).decorate
    @reviews = @place.reviews.order(:id)
    @place.increment!(:visits)
    @near_places = Place.near([@place.latitude, @place.longitude], 5).where(category_id: @place.category_id).where.not(id: @place.id).includes(:place_images)
  end

  def new
    @place = Place.new
    @categories = Category.all
    get_current_coordinates
  end

  def create
    if current_user
      @place = current_user.places.new(place_params)
    else
      @place = Place.new(place_params)
    end

    @place.save!
    flash[:success] = 'Место отправлено на модерацию'
    redirect_to place_path(@place.id)
  end

  private

    def place_params
      params.require(:place).permit(:title, :category_id, :address, :description, :image1, :image2, :image3, place_images_attributes: [:id, :image, :_destroy]).merge(rating: params[:rating], latitude: params[:latitude], longitude: params[:longitude] )
    end

    def filtering_params(params)
      params.slice(:category_id, :reviews_count, :rating)
    end
end
