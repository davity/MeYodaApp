class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :value
      t.references :card_type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
