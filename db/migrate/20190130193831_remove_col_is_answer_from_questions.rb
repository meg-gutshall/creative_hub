class RemoveColIsAnswerFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :is_answer
  end
end
