class RenameUserFoodItemUserIdColumn < ActiveRecord::Migration
  def up
  	rename_column :user_food_items, :user_id, :fridge_id
  end

  def down
  	rename_column :user_food_items, :fridge_id, :user_id
  end
end
