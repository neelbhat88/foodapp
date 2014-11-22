class GlobalFoodItem < ActiveRecord::Base
  attr_accessible :avgexpirationdays, :category, :name, :photo

  has_attached_file :photo, :styles => { :medium => "300x300>", :small => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :name, presence: true
  validates :category, presence: true
  validates :avgexpirationdays, presence: true

  def GetCategories
  	return ['Bakery', 'Baking','Beverages','Soups & Canned Goods','Cereal/Breakfast','Condiments & Sauces','Dairy',
  			'Deli','Frozen Foods','Meats & Seafood','Grains, Pasta & Beans','Produce','Snacks','Spices']

  	#['Baking','Beverages','Canned Goods','Cereal/Breakfast','Condiments','Dairy',
  	#		'Deli','Frozen Foods','Meats','Pasta/Rice','Produce','Snacks','Spices']

  	# GlobalFoodItem.where("category = 'Meats'").update_all("category = 'Meats & Seafood'")
  	# GlobalFoodItem.where("category = 'Condiment'").update_all("category = 'Condiments & Sauces'")
  	# GlobalFoodItem.where("category = 'Pasta/Rice'").update_all("category = 'Grains, Pasta & Beans'")
  	# GlobalFoodItem.where("category = 'Canned Goods'").update_all("category = 'Soups & Canned Goods'")
  	# Change Bread to 'Bakery'
  end
end
