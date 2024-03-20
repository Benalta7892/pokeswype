class CardWish < ApplicationRecord
  belongs_to :card
  belongs_to :user
end
