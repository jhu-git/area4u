class NewslettersController < ApplicationController
  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.save
    redirect_to newsletter_subscribed_path(@newsletter)
  end

  def subscribed

  end
  private

  def newsletter_params
    params.require(:newsletter).permit(:email)
  end
end
