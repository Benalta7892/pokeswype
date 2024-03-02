class Exchange < ApplicationRecord
  belongs_to :dealer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :cards_interests
  has_many :reviews

  enum status: { initialised: 0, pending: 1, accepted: 2, rejected: 3, finished: 4 }
end
