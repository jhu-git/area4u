class AddOwnerProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :owner_profile, :boolean
  end
end
