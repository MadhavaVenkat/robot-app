class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :x
      t.integer :y
      t.string :face

      t.timestamps
    end
  end
end
