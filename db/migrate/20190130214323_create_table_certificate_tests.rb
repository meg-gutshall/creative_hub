class CreateTableCertificateTests < ActiveRecord::Migration
  def change
  	create_table :certificate_tests do |t|
  		t.integer :certificate_id
  		t.integer :test_id
  	end
  end
end
