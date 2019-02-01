class CreateTableCertificateUsers < ActiveRecord::Migration
  def change
  	create_table :certificate_users do |t|
  		t.integer :certificate_id
  		t.integer :user_id
  	end
  end
end
