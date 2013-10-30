class Sale < ActiveRecord::Base
  belongs_to :card
  validates_numericality_of :starting_price, greater_than_or_equal_to: 0
  validates :starting_price, presence: true
end
