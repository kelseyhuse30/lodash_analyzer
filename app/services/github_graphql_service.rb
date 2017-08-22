require 'pry'
require_relative '../modules/GithubAPI.rb'
require_relative '../modules/Org.rb'
require_relative '../modules/Repos.rb'
require_relative '../modules/PullRequests.rb'

class GithubGraphqlService
	include GithubAPI, Org, Repos

	def get_org
		result = GithubAPI::Client.query(Org::Query)
		org = Organization.find_or_create_by(login: "lodash")
		org.update(result.original_hash["data"]["organization"])
	end

	def get_repos
		result = GithubAPI::Client.query(Repos::Query)
		org = Organization.find_or_create_by(login: "lodash")
		result.original_hash["data"]["organization"]["repositories"]["edges"].each{|node|
			repo = Repo.find_or_create_by(github_id: node["node"]["id"])
			repo.update(name: node["node"]["name"], description: node["node"]["description"], github_created_at: node["node"]["createdAt"], organization_id: org.id)
			repo.save
		}
	end

	def get_pull_requests
		result = GithubAPI::Client.query(PullRequests::Query)
		result.original_hash["data"]["organization"]["repositories"]["edges"].each{|repoEdge|
			repo = Repo.find_or_create_by(github_id: repoEdge["node"]["id"])
			repoEdge["node"]["pullRequests"]["edges"].each{|pullEdge|
				pull = PullRequest.find_or_create_by(github_id: pullEdge["node"]["id"])
				pull.update(state: pullEdge["node"]["state"], number: pullEdge["node"]["number"], title: pullEdge["node"]["title"], github_created_at: pullEdge["node"]["createdAt"], repo_id: repo.id)
				pull.save
				user = User.find_or_create_by(github_id: pullEdge["node"]["author"]["id"])
				user.login = pullEdge["node"]["author"]["login"]
				user.save
				pull.user_id = user.id
				pull.save
			}
			repo.save
		}
	end
	
end