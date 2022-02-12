# app/controllers/flats_controller.rb
class PropertiesController < ApplicationController
  def index

    if params[:query].present? || params[:check_in].present? || params[:check_out].present?
      sql_query = "name ILIKE :query
                   OR location ILIKE :query
                   OR category ILIKE :query
                   OR theme ILIKE :query"
      @allproperties = Property.where(sql_query, query: "%#{params[:query]}%")
      # @properties = @all_properties.select do |property|
      #   available?(property)
      #   raise
      # end
      @properties = @allproperties.reject{|property| !available?(property)}
    else
      @properties = Property.all

    if @properties.class != Array
      @markers = @properties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude
        }
      end
    else
      @markers = @allproperties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude
        }
      end


    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }

    end
  end

  def create
    @property = Property.new
  end

  def new
    @property = Property.new
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
  end

  def edit
  end

  def update
  end

 property_page
  def show
    if user_signed_in?
      @property = Property.find(params[:id])
      @booking = Booking.new
    else
      redirect_to new_user_session_path
    end
  end

  private

  def available?(property)
    bookings = Booking.where(property_id: property)
    booleans = []
    bookings.each do |booking|
      if booking[:start] != nil && booking[:end] != nil
        booleans << (booking[:start] <= params["check_in"] && booking[:end] <= params["check_in"])
        booleans << (booking[:start] >= params["check_in"] && booking[:start] >= params["check_out"])
        booleans << (booking[:start] <= params["check_out"] && booking[:end] <= params["check_in"])
        booleans << (booking[:start] >= params["check_out"] || booking[:end] <= params["check_in"])
        booleans << (booking[:end] >= params["check_in"] && booking[:start] >= params["check_out"])
        booleans << (booking[:end] <= params["check_out"] && booking[:end] >= params["check_in"])
      end
    end
    return !booleans.include?(false)
  end

end

  def index
      @properties = Property.all

      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @properties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude
        }
      end
    end

  end

