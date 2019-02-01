class Test < ActiveRecord::Base
	has_many :questions
	has_many :certificates, through: :certificate_tests
	has_many :certificate_tests
end