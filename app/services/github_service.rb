require 'pry'
class GithubService

	@@root_url = 'https://api.github.com/'
	@@root_url_graphql = 'https://api.github.com/graphql'

	def pull_requests(owner, repo)

		resp = Faraday.get "#{@@root_url}/repos/#{owner}/#{repo}/pulls" do |req|
			req.headers['Accept'] = 'application/vnd.github.v3+json'
	  end

	  body = JSON.parse(resp.body)
	  binding.pry
	  if resp.success?
	    pulls = body["response"]
	    pulls.each {|pull|
	    	PullRequest.find_or_create_by(pull_request_id: pull[:id])
	    }
	  else
	    error = body["meta"]["errorDetail"]
	  end

	  pulls ? pulls : error

	end

	def create_org(org)

		resp = Faraday.get "#{@@root_url}/orgs/#{org}" do |req|
			req.headers['Accept'] = 'application/vnd.github.v3+json'
		end

		Organization.

	end

	private

	def org_params
	end

	def repo_params
	end

	def user_params
	end

	def pull_request_params
	end

end