class AddNameToUserFoodItem < ActiveRecord::Migration
  def change
  	add_column :user_food_items, :name, :string
  end

  def down
  	remove_column :user_food_items, :name
  end
end
