class Exchange < ApplicationRecord
  belongs_to :dealer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :card_interests
  has_many :reviews
  has_many :cards, through: :card_interests

  enum status: { pending: 0, accepted: 1, rejected: 2, finished: 3 }
end
