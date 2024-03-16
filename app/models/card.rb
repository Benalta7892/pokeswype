class Card < ApplicationRecord
  has_many :user_cards
  has_many :users, through: :user_cards

  def ready_for_exchange_collectors
    UserCard.where(card_id: id, exchangeable: true).map(&:user)
  end
end
