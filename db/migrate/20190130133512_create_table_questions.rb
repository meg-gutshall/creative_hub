class CreateTableQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :text
  		t.boolean :is_answer
  		t.integer :test_id
  	end
  end
end
