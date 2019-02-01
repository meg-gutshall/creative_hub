class UsersController < ApplicationController
	get '/users' do
		if !current_user.is_admin
			redirect '/'
		end

		@users = User.all
		erb :'/users/index'
	end	

	get '/users/:id' do
		@user = User.find(params[:id])

		erb :'/users/show'
	end
end