class PropertiesController < ApplicationController
  def index
    @properties = Property.all
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