class PullRequestsController < ApplicationController

	def upload
		PullRequestsWorker.perform_async(params[:repos].path)
	end

end
