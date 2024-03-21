class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :exchange

  # Methode pour recuperer l'autre utilisateur
  def other_user(current_user)
    exchange = self.exchange
    if exchange.dealer == current_user
      return exchange.receiver
    elsif exchange.receiver == current_user
      return exchange.dealer
    end
  end
end
