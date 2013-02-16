class AddAttachmentPhotoToGlobalFoodItems < ActiveRecord::Migration
  def self.up
    change_table :global_food_items do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :global_food_items, :photo
  end
end
