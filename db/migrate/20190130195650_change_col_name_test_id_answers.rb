class ChangeColNameTestIdAnswers < ActiveRecord::Migration
  def change
  	rename_column :answers, :test_id, :question_id
  end
end
