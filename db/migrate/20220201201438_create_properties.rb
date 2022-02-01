class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.text :description
      t.string :name
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :theme
      t.integer :price
      t.boolean :availability

      t.timestamps
    end
  end
end
