class AddColumnEquipIdToCertificates < ActiveRecord::Migration
  def change
  	add_column :certificates, :equipment_id, :integer
  end
end
