class FoodItem < ActiveRecord::Base
  attr_accessible :category, :datebought, :epxpirationdays, :name, :usebydate
end
