class UserFoodItem < ActiveRecord::Base
  belongs_to :global_food_item
  belongs_to :user

  attr_accessible :global_food_item_id, :datebought, :usebydate

  validates :global_food_item_id, presence: true
  validates :user_id, presence: true
  validates :datebought, presence: true
  validates :usebydate, presence: true
end
