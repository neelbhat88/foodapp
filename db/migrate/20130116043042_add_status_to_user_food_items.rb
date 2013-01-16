class AddStatusToUserFoodItems < ActiveRecord::Migration
  def change
  	add_column :user_food_items, :status, :integer, :default => 0
  	add_column :user_food_items, :removedate, :date
  end
end
