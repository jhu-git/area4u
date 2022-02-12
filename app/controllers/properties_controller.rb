# app/controllers/flats_controller.rb
class PropertiesController < ApplicationController
  def index

    if params[:query].present?
      sql_query = "name ILIKE :query
                   OR location ILIKE :query
                   OR category ILIKE :query
                   OR theme ILIKE :query"
      @properties = Property.where(sql_query, query: "%#{params[:query]}%")
    else
      @properties = Property.all
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
