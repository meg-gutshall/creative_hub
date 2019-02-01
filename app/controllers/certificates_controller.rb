class CertificatesController < ApplicationController
	get '/certificates' do
		@certificates = Certificate.all

		erb :'/certificates/index'
	end

	get '/cerificates/:id' do
		@cert = Certificate.find(params[:id])

		erb :'/cerificates/show'
	end
end