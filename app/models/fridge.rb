class Fridge < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :users
  has_many :user_food_items, :dependent => :destroy

  validates :name, presence: true
end
