class Card < ActiveRecord::Base
	belongs_to :card_type

	attr_accessor	:card_type_name	
	attr_accessor	:card_type_edition
	
end
