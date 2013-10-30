class Account < ActiveRecord::Base
  belongs_to :user
  NUMBER_REGEX = /\A[0-9 -]+\z/i # number structure to match
  validates :number, :presence => true, uniqueness: true, :format => NUMBER_REGEX
  validates :user_id, :presence => true, uniqueness: true
  validates_numericality_of :balance, greater_than_or_equal_to: 0
  validates :balance, :presence => true
end
