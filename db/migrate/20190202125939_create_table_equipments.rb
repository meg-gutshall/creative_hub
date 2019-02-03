class CreateTableEquipments < ActiveRecord::Migration
  def change
  	create_table :equipment do |t|
  		t.string :name
  		t.integer :certificate_id
  	end
  end
end
