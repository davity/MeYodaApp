class Bid < ActiveRecord::Base
  belongs_to :card_type
  belongs_to :user
end
