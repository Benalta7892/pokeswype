class CardInterest < ApplicationRecord
  belongs_to :user
  belongs_to :card
  belongs_to :exchange
end
