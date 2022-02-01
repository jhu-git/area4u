class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status
      t.references :property, null: false, foreign_key: true
      t.string :payment_method
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
