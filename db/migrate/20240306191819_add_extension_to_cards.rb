class AddExtensionToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :extension, :string
  end
end
