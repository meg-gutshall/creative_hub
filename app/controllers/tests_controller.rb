class TestsController < ApplicationController

	get '/tests' do
		@tests = Test.all

		erb :'/tests/index'
	end

	get '/tests/new' do
		@certificates = Certificate.all

		erb :'/tests/new'
	end

	post '/tests' do
		# check to see if certificate_ids is empty
		if !params[:test].keys.include?("certificate_ids")
			params[:test][:certificate_ids] = []
		end

		# check to see if a new certificate name was given
		if !params[:certificate][:name].empty?
			new_certificate = Certificate.create(params[:certificate])
			params[:test][:certificate_ids] << new_certificate.id
		end

		new_test = Test.new(params[:test])
		params[:questions].each do |question|
			if !question[:text].empty?
				new_q = Question.new(:text => question[:text])
				question[:answers].each do |answer|
					if !answer[:text].empty?
						new_a = Answer.create(answer)
						new_q.answers << new_a
					end
				end
				new_q.save  
				new_test.questions << new_q
			end
		end
		new_test.save
		
		redirect '/tests'
	end

	get '/tests/:id' do
		@test = Test.find(params[:id])

		erb :'/tests/show'
	end

	patch '/tests/:id' do
		current_test = Test.find(params[:id])
		current_test.update(:name => params[:test][:name])

		# deal with certificates first
		# if user entered a new certificate name, create it
		if !params[:certificate][:name].empty?
			cert = Certificate.create_or_find_by(params[:certificate])
			current_test.certificates << cert
		end
		
		# next, go through certificate_ids, see if they've been updated
		binding.pry
		if !params[:test].keys.include?("certificate_ids")
			params[:test][:certificate_ids] = []
		end

		# set the test certificate id's
		current_test.certificate_ids = params[:test][:certificate_ids]

		# deal with question data now
		# check for new question params
		if !params[:new][:text].empty?
			q = Question.new(:text => params[:new][:text])
			params[:new][:answers].each do |answer|
				if !answer[:text].empty?
					a = Answer.create(answer)
					q.answers << a
				end
			end
			q.save
			current_test.questions << q
		end

		# check existing questions
		params[:questions].each do |id, q_values|
			q = Question.find(id)

			# if field was emptied, delete the record
			if q_values[:text].empty?
				
				# delete the associate answers so they don't clog up the db
				q.answers.each do |a|
					a.delete
				end
				q.delete
			else
				if !params[:answers][q.id.to_s][:text].empty?
					new_a = Answer.create(params[:answers][q.id.to_s])
					q.answers << new_a
				end
				q_values[:answers].each do |id, ans_values|
					a = Answer.find(id)
					if ans_values[:text].empty?
						a.destroy
					else
						if !ans_values.keys.include?("is_correct")
							a[:is_correct] = false
						end
						a.update(ans_values)
					end
				end
				q.update(:text => q_values[:text])
			end
		end

		redirect "/tests/#{params[:id]}"
	end

	get '/tests/:id/edit' do
		@test = Test.find(params[:id])
		@certificates = Certificate.all

		erb :'/tests/edit'
	end

	delete '/tests/:id' do
		"Made it to delete page"
	end
end