class Question < ActiveRecord::Base
	belongs_to :test
	has_many :answers
	validates_presence_of :text
end