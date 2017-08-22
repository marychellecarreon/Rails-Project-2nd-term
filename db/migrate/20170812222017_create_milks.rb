class CreateMilks < ActiveRecord::Migration
  def change
    create_table :milks do |t|
      t.integer :price
      t.string :owner
      t.string :country
      t.string :city
      t.string :avatar

      t.timestamps null: false
    end
  end
end
