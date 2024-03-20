class AddWishListToUserCards < ActiveRecord::Migration[7.1]
  def change
    add_column :user_cards, :wish_list, :boolean
  end
end
