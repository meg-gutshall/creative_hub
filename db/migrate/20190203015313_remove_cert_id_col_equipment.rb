class RemoveCertIdColEquipment < ActiveRecord::Migration
  def change
  	remove_column :equipment, :certificate_id
  end
end
