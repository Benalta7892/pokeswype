class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :serie
      t.date :released_date
      t.string :number
      t.string :rarity
      t.string :category

      t.timestamps
    end
  end
end
