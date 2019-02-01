class CertificatesController < ApplicationController
	get '/certificates' do
		@certificates = Certificate.all

		erb :'/certificates/index'
	end

	get '/certificates/new' do
		@tests = Test.all

		erb :'/certificates/new'
	end

	get '/certificates/:id' do
		@cert = Certificate.find(params[:id])

		erb :'/certificates/show'
	end

	get '/certificates/:id/edit' do
		@cert = Certificate.find(params[:id])

		erb :'/certificates/edit'
	end

	patch '/certificates/:id' do
		@cert = Certificate.find(params[:id])
		@cert.update(params[:certificate])

		redirect "/certificates/#{@cert.id}"
	end

	post '/certificates' do
		new_cert = Certificate.create(params)

		redirect "/certificates"
	end

	delete '/certificates/:id' do
		@certificate = Certificate.find(params[:id])

		@certificate.destroy
		redirect '/certificates'
	end
end