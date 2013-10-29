class Account < ActiveRecord::Base
  belongs_to :user
  NUMBER_REGEX = /\A[0-9]+\z/i # number structure to match
  validates :number, :presence => true, uniqueness: true, :format => NUMBER_REGEX
  validates :user_id, :presence => true, uniqueness: true
end
