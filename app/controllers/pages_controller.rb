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
  end

  def profile
  end
end
