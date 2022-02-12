class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates_presence_of :start, :end, :guests
end

# #######
# private
# #######

# def end_is_after_start
#   return if end.blank? || start.blank?

#   if end < start
#     errors.add(:end, "cannot be before the start date & time")
#   end
