class CreateTableTestUsers < ActiveRecord::Migration
  def change
  	create_table :test_users do |t|
  		t.integer :test_id
  		t.integer :user_id
  	end
  end
end
