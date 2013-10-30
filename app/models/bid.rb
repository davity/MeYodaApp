class Bid < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :user
  
  validates_numericality_of :value, greater_than_or_equal_to: 0
  validates :value, presence: true
end
