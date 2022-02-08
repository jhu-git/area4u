class PagesController < ApplicationController
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
end
