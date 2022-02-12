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
    end

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
    end
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to dashboard_path
    else
      raise
    end
  end

  def new
    @property = Property.new
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to dashboard_path
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    if @property.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end


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
        if booking[:start] <= params["check_in"]
          booleans << (booking[:end] <= params["check_in"])
        elsif booking[:start] >= params["check_in"]
          booleans << (booking[:start] >= params["check_out"])
        elsif booking[:start] <= params["check_out"]
          booleans << (booking[:end] <= params["check_in"])
        elsif booking[:start] >= params["check_out"]
          booleans << true
        elsif booking[:end] <= params["check_in"]
          booleans << true
        elsif booking[:end] >= params["check_in"]
          booleans << (booking[:start] >= params["check_out"])
        elsif booking[:end] <= params["check_out"]
          booleans << (booking[:end] >= params["check_in"])
        end
      end
    end
    return !booleans.include?(false)
  end

  def property_params
    params.require(:property).permit(:name, :description, :location, :category, :theme, :price, :user_id)
  end
end
