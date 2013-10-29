class RemoveCodeFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :code, :integer
  end
end
