class CardType < ActiveRecord::Base
	has_many :cards

	validates :name, presence: true
	validates :edition, presence: true
end
