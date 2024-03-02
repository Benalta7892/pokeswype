class AddImagetoCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :image, :string
  end
end
