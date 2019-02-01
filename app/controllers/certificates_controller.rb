class CertificatesController < ApplicationController
	get '/certificates' do
		@certificates = Certificate.all

		erb :'/certificates/index'
	end

	get '/certificates/:id' do
		@cert = Certificate.find(params[:id])

		erb :'/certificates/show'
	end
end