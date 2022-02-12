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
    @properties = Property.where(user_id: current_user)
  end

  def profile
  end
end
