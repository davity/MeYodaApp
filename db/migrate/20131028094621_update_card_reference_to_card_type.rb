class UpdateCardReferenceToCardType < ActiveRecord::Migration
  def change
  	rename_column :cards, :CardType_id, :card_type_id
  end
end
