class CreateTableTests < ActiveRecord::Migration
  def change
  	create_table :tests do |t|
  		t.string :name
  		t.integer :certificate_id
  	end
  end
end
