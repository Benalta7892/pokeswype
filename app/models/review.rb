class Review < ApplicationRecord
  belongs_to :user
  belongs_to :exchange

  AUTHORIZED_RATINGS = (1..5)

  validates :rating, presence: true, inclusion: { in: AUTHORIZED_RATINGS }

end
