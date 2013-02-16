class UserFoodItem < ActiveRecord::Base
  belongs_to :global_food_item
  belongs_to :fridge

  attr_accessible :global_food_item_id, :fridge_id, :datebought, :usebydate, :status, :removedate, :price, :name

  #validates :global_food_item_id, presence: true
  validates :fridge_id, presence: true
  validates :datebought, presence: true
  #validates :usebydate, presence: true

  def DisplayUseByDate
  	self.usebydate.strftime("%m/%d/%y")
  end

  def DisplayPrice
  	number_to_currency(self.price, :unit => "$")  	
  end
end
