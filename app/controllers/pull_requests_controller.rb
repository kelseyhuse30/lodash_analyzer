class PullRequestsController < ApplicationController
	before_action :set_pull_request, only: [:show, :update, :destroy]

	def index
		pull_requests = PullRequest.all
		render json: pull_requests
	end

	def create
		pull_request = PullRequest.create(pull_params)
		render json: pull_request
	end

	def show
		render json: pull_request
	end

	def update
		pull_request.update(pull_params)
		render json: pull_request
	end

	def destroy
		pull_request.destroy
	end

	private

	def set_pull_request
		pull_request = PullRequest.find(params[:id])
	end

	def pull_params
		params.permit(:github_id, :url, :html_url, :number, :state, :title, :github_created_at, :repo, :user_id)
	end

end