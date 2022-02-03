class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @ooking = Booking.new
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
end
