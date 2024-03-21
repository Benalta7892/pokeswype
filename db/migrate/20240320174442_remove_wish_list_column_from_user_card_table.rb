class RemoveWishListColumnFromUserCardTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_cards, :wish_list, :boolean
  end
end
