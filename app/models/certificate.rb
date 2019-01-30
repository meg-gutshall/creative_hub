class Certificate < ActiveRecord::Base
	has_one :test
	has_many :users, through: :certificate_users
	has_many :certificate_users
end