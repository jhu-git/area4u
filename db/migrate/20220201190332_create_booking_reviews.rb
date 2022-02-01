class CreateBookingReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_reviews do |t|
      t.text :content
      t.references :booking, null: false, foreign_key: true
      t.interger :booking_rating

      t.timestamps
    end
  end
end
