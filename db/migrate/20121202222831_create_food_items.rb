class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :category
      t.integer :epxpirationdays
      t.datetime :datebought
      t.datetime :usebydate

      t.timestamps
    end
  end
end
