class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :starting_price

      t.timestamps
    end
  end
end
