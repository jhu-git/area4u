class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    if available?
      @booking.save
      redirect_to dashboard_path
    else
      redirect_to property_path(params[:property_id]), info: "The property is booked for those dates/times."
    end
  end

  def new
    @booking = Booking.new
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def booking_params
    {
      user_id: params[:user_id],
      property_id: params[:property_id],
      start: params[:start],
      end: params[:end],
      guests: params[:guests]
    }
  end

  def available?
    bookings = Booking.where(property_id: params[:property_id])
    booleans = []
    bookings.each do |booking|
      booleans << (booking[:start] <= params[:start] && booking[:end] <= params[:start])
      booleans << (booking[:start] >= params[:start] && booking[:start] >= params[:end])
      booleans << (booking[:start] <= params[:end] && booking[:end] <= params[:start])
      booleans << (booking[:start] >= params[:end] || booking[:end] <= params[:start])
      booleans << (booking[:end] >= params[:start] && booking[:start] >= params[:end])
      booleans << (booking[:end] <= params[:end] && booking[:end] >= params[:start])
    end
    return !booleans.include?(false)
  end
end
