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

  def newsletter
  end

  def newsletter_submit
    raise
    puts params
  end
end
