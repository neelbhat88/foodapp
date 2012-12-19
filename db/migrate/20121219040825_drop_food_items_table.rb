class DropFoodItemsTable < ActiveRecord::Migration
  def up
  	drop_table :food_items
  end

  def down
  	create_table :food_items
  end
end
