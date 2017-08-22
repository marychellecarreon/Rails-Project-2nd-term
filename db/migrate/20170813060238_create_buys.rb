class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.date :purchased_date
      t.integer :price
      t.integer :totalprice
      t.references :user, index: true, foreign_key: true
      t.references :milk, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
