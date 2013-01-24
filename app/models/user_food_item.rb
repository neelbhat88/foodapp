class UserFoodItem < ActiveRecord::Base
  belongs_to :global_food_item
  belongs_to :fridge

  attr_accessible :global_food_item_id, :datebought, :usebydate, :status, :removedate

  validates :global_food_item_id, presence: true
  validates :fridge_id, presence: true
  validates :datebought, presence: true
  validates :usebydate, presence: true
end
