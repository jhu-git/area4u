# app/controllers/flats_controller.rb
class PropertiesController < ApplicationController
  def index
    @properties = Property.all

    # the `geocoded` scope filters only properties with coordinates (latitude & longitude)
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end
end
