class CreateTableAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
  		t.string :text
  		t.boolean :is_correct, :default => false
  		t.integer :question_id
  	end
  end
end
