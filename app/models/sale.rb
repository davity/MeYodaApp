class Sale < ActiveRecord::Base

	validates :starting_price, presence: true

end
