class Test < ActiveRecord::Base
	has_many :questions
	belongs_to :certificate
end