class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home, :signup]

  def home
    @property = Property.all
  end

  def categories
    @properties = Property.all
      @markers = @properties.geocoded.map do |property|
        {
          lat: property.latitude,
          lng: property.longitude
        }
      end
  end

  def locations
  end

  def themes
  end

  def about
  end

  def dashboard
    @properties = Property.where(user_id: current_user)
    @bookings = Booking.where(user_id: current_user.id)
  end

  def profile
  end

  def confirmation
    @booking = Booking.last
    @property = Property.find(@booking[:property_id])
  end

end
