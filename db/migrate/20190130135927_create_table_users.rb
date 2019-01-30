class CreateTableUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email, uniqueness: true
  		t.string :phone_number
  		t.text :bio
  		t.boolean :is_admin
  		t.boolean :is_volunteer
  		t.boolean :account_paid
  		t.boolean :is_checked_in
  		t.string :password_digest
  	end
  end
end
