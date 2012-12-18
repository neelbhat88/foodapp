class GlobalFoodItem < ActiveRecord::Base
  attr_accessible :avgexpirationdays, :category, :name

  validates :name, presence: true
  validates :category, presence: true
  validates :avgexpirationdays, presence: true
end
