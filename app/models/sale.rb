class Sale < ActiveRecord::Base
  belongs_to :card
	validates :starting_price, presence: true

end
