class Account < ActiveRecord::Base
  belongs_to :user
  NUMBER_REGEX = /\A[0-9]+\z/i # number structure to match
  DECIMAL_NUMBER_REGEX = /\A([0-9]+\.[0-9]+|[0-9]+)\z/i # decimal number structure to match
  validates :number, :presence => true, uniqueness: true, :format => NUMBER_REGEX
  validates :user_id, :presence => true, uniqueness: true
  validates :balance, :presence => true, uniqueness: false, :format => DECIMAL_NUMBER_REGEX # this check does not work
end
