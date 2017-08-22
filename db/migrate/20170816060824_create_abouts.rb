class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :comment

      t.timestamps null: false
    end
  end
end
