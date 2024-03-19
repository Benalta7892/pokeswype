class AddExchangeToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :exchange, null: false, foreign_key: true
  end
end
