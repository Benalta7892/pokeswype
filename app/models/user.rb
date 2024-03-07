class User < ApplicationRecord
  has_many :user_cards, dependent: :destroy
  has_many :cards, through: :user_cards
  has_many :exchanges_as_dealer, class_name: 'Exchange', foreign_key: 'dealer_id'
  has_many :exchanges_as_receiver, class_name: 'Exchange', foreign_key: 'receiver_id'
  has_many :reviews
  has_many :cards_interests


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
