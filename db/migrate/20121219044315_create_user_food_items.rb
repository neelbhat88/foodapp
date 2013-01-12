class CreateUserFoodItems < ActiveRecord::Migration
  def change
    create_table :user_food_items do |t|
      t.references :global_food_item
      t.references :user
      t.date :datebought
      t.date :usebydate

      t.timestamps
    end
    add_index :user_food_items, :global_food_item_id
    add_index :user_food_items, :user_id
  end
end
