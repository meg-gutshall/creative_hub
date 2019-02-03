class AddColumnEquipmentInUse < ActiveRecord::Migration
  def change
  	add_column :equipment, :in_use, :boolean, :default => false
  end
end
