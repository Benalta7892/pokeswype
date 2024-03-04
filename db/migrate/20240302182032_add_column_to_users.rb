class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :global_rating, :integer
    add_column :users, :avatar, :string
  end
end
