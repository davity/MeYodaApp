class AddPhotoDirToCardTypes < ActiveRecord::Migration
  def change
    add_column :card_types, :photo_dir, :string
  end
end
