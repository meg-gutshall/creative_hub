class EquipmentController < ApplicationController
	get '/equipment' do
	    if !current_user.is_admin
			redirect '/'
	    end

	    @equipments = Equipment.all
	    erb :'/equipment/index'
 	end

 	get '/equipment/new' do
 		if !current_user.is_admin
			redirect '/'
	    end

	    erb :'/equipment/new'
    end

    get '/equipment/:id' do
    	@equip = Equipment.find(params[:id])

    	erb :'/equipment/show'
    end

    get '/equipment/:id/edit' do
    	if !current_user.is_admin
			redirect '/'
	    end

    	@equip = Equipment.find(params[:id])
    	@certifs = Certificate.all
    	erb :'/equipment/edit'
    end	

    patch '/equipment/:id' do
    	if !current_user.is_admin
			redirect '/'
	    end
    	
    	equip = Equipment.find(params[:id])
    	equip.update(:name => params[:name], :certificate => Certificate.find(params[:certificate_id]))
    	binding.pry
		redirect "/equipment/#{equip.id}"
    end

    delete '/equipment/:id' do
    	if !current_user.is_admin
			redirect '/'
	    end

	    Equipment.find(params[:id]).delete
	    redirect '/equipment'
    end
end