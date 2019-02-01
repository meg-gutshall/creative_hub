class AnswersController < ApplicationController
	delete '/answers/:id' do
		@answer = Answer.find(params[:id])
		@test = @answer.test

		@answer.delete
		redirect "/tests/#{@test.id}/edit"
	end
end