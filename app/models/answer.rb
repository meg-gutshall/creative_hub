class Answer < ActiveRecord::Base
	belongs_to :question
	validates_presence_of :text

	def set_defaults
    	self.is_correct = false if self.bool_field.nil?
  	end
end