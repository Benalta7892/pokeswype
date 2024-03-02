class CreateExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :exchanges do |t|
      t.datetime :meeting_date
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :status, default: 0
      t.references :dealer, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
