class AddFavoriteToUserCards < ActiveRecord::Migration[7.1]
  def change
    add_column :user_cards, :favorite, :boolean, default: false
  end
end
