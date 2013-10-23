class CardType < ActiveRecord::Base
	validates :name, presence: true
	validates :edition, presence: true
end
