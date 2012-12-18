class CreateGlobalFoodItems < ActiveRecord::Migration
  def change
    create_table :global_food_items do |t|
      t.string :name
      t.string :category
      t.integer :avgexpirationdays

      t.timestamps
    end
  end
end
