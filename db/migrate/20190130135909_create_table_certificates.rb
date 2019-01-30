class CreateTableCertificates < ActiveRecord::Migration
  def change
  	create_table :certificates do |t|
  		t.string :name
  		t.integer :test_id
  	end
  end
end
