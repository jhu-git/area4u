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

  def show
  end
end
