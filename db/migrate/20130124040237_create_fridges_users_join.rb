class CreateFridgesUsersJoin < ActiveRecord::Migration
  def up
  	create_table 'fridges_users', :id => false do |t|
  		t.column 'fridge_id', :integer
  		t.column 'user_id', :integer
  	end
  end

  def down
  	drop_table 'fridges_users'
  end
end
