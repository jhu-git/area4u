class CreateBookingReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.integer :booking_ratings
      t.text :content

      t.timestamps
    end
  end
end
