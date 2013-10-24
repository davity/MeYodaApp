class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :code
      t.references :CardType, index: true

      t.timestamps
    end
  end
end
