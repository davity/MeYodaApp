class AddCardRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :card, index: true
  end
end
