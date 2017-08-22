class AddMoreFieldsToMilk < ActiveRecord::Migration
  def change
    add_column :milks, :currency, :string
  end
end
