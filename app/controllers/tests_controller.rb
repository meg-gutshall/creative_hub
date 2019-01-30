class TestsController < ApplicationController

	get '/tests' do
		@tests = Tests.all

		erb :'/tests/index'
	end

	get '/tests/new' do
		erb :'/tests/new'
	end

	post '/tests' do
		binding.pry
		
	end
end