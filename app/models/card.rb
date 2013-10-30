class Card < ActiveRecord::Base
	belongs_to :card_type
	belongs_to :user
	has_one :sale, dependent: :destroy
end
