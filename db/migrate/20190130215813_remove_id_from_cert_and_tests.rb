class RemoveIdFromCertAndTests < ActiveRecord::Migration
  def change
  	remove_column :certificates, :test_id
  	remove_column :tests, :certificate_id
  end
end
