class CardType < ActiveRecord::Base
	has_many :cards, dependent: :destroy
  has_many :bids, dependent: :destroy

	validates :name, presence: true
	validates :edition, presence: true
end
