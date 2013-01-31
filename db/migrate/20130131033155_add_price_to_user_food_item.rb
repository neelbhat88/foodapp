class AddPriceToUserFoodItem < ActiveRecord::Migration
  def change
  	add_column :user_food_items, :price, :decimal
  end

  def down
  	remove_column :user_food_items, :price
  end
end
