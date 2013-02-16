class Fridge < ActiveRecord::Base
  attr_accessible :name  

  has_and_belongs_to_many :users
  has_many :user_food_items, :dependent => :destroy

  validates :name, presence: true

  def GetFoodItems
  	self.user_food_items.where(:status => 0).sort_by(&:usebydate)
  end
end
