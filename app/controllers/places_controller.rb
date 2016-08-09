class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  respond_to :json

  def index
    @places = Place.where(nil).active.includes(:category)
    filtering_params(params).each do |key, value|
      @places = @places.public_send(key, value) if value.present?
    end
    respond_with @places
  end

  def show
    @place = Place.find(params[:id]).decorate
    @reviews = @place.reviews.with_comments.order('id DESC')
    @place.increment!(:visits)
    @near_places = Place.near([@place.latitude, @place.longitude], 5).where(category_id: @place.category_id).where.not(id: @place.id).includes(:place_images, :category)
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

    @place.active = true if Setting.find_by(key: 'places_moderation').status == false
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
