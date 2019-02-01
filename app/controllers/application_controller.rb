require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "3lklk2ml23-0op;l"
    enable :sessions
  end

  get '/' do
    
  	erb :index
  end

  get '/login' do
    
    erb :login
  end

  get '/logout' do
    session.clear

    redirect '/'
  end

  post '/login' do
    user = User.find_by(:email => params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    binding.pry
    if User.find_by(:email => params[:email])
      message = "Duplicate email. Please try again."
      redirect '/signup'
    end
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      message ="Something went wrong, please try again."
      redirect '/signup'
    end
  end

  helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end