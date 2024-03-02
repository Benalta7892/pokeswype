class CreateCardInterests < ActiveRecord::Migration[7.1]
  def change
    create_table :card_interests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.references :exchange, null: false, foreign_key: true

      t.timestamps
    end
  end
end
