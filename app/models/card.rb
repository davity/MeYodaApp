class Card < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :CardType
=======
	belongs_to :card_type

	attr_accessor	:card_type_name	
	attr_accessor	:card_type_edition
	
>>>>>>> 204073be7cfe6a58469c6377091f9a1e2a7f478d
end
