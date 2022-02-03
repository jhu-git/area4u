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

end
