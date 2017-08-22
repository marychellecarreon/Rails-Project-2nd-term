class AddMoreFieldsToMilks < ActiveRecord::Migration
  def change
    add_column :milks, :latitude, :float
    add_column :milks, :longitude, :float
    add_reference :milks, :milk, index: true, foreign_key: true
  end
end
