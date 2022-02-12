class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home, :signup]

  def home
    @property = Property.all
  end

  def categories
  end

  def locations
  end

  def themes
  end

  def about
  end

  def dashboard
  end

  def profile
  end

  def confirmation
    @booking = Booking.last
    @property = Property.find(@booking[:property_id])
  end

end
