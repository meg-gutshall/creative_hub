class TestsController < ApplicationController

	get '/tests' do
		@tests = Tests.all
		
		erb :'/tests/index'
	end
end