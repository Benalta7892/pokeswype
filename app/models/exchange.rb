class Exchange < ApplicationRecord
  belongs_to :dealer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :card_interests
  has_many :reviews
  has_many :cards, through: :card_interests

  enum status: { initialised: 0, pending: 1, accepted: 2, rejected: 3, finished: 4 }
end
