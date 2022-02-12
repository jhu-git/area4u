class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    if available?
      @booking.save
      redirect_to confirmation_path
    else
      redirect_to property_path(params[:property_id]), info: "The property is booked for those dates/times."
    end
  end

  def new
    @booking = Booking.new
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  def edit
  end

  def update
  end

  def show
    @property = Property.find(params[:id])
    @bookings = Booking.where(property_id: @property)
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
      if (booking[:start] <= params[:start])
        booleans << (booking[:end] <= params[:start])
      elsif (booking[:start] >= params[:start])
        booleans << (booking[:start] >= params[:end])
      elsif booking[:start] <= params[:end]
        booleans << (booking[:end] <= params[:start])
      elsif booking[:start] >= params[:end]
        booleans << true
      elsif booking[:end] <= params[:start]
        booleans << true
      elsif booking[:end] >= params[:start]
        booleans << (booking[:start] >= params[:end])
      elsif booking[:end] <= params[:end]
        booleans << (booking[:end] >= params[:start])
      end
    end
    return !booleans.include?(false)
  end
end
