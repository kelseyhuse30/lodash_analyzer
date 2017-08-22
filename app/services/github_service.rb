require 'pry'

class GithubService
	attr_accessor :org, :conn

	def initialize(org_name)
		self.org = Organization.find_or_create_by(login: org_name)
		self.conn = Faraday.new(:url => 'https://api.github.com', :headers => {'Accept' => 'application/vnd.github.v3+json'})
		self.graphqlconn = Faraday.new(:url => '', :headers => {'Authorization' => "Bearer #{GITHUB_TOKEN}"})
	end

	def create_org
		resp = conn.get URI.parse(URI.encode("orgs/#{org.login}"))
		body = JSON.parse(resp.body)

		org.login = body["login"]
		org.url = body["url"]
		org.repos_url = body["repos_url"]
		org.description = body["description"]
		org.public_repos = body["public_repos"]
		org.html_url = body["html_url"]
		org.github_created_at = body["created_at"]
		org.save
	end

	def create_org_graphql
		org_query = {
			organization(login: org.login) {
				url
				description
			}
		}

		resp = graphqlconn.get {:query => org_query}
		body = JSON.parse(resp.body)

		org.url = body.data.url
		org.description = body.data.description
		org.save
	end

	def create_repos
		resp = conn.get URI.parse(URI.encode("orgs/#{org.name}/repos"))
		body = JSON.parse(resp.body)

		body.each { |repo|
			new_repo = Repo.find_or_create_by(github_id: repo["id"])
			new_repo.name = repo["name"]
			new_repo.html_url = repo["html_url"]
			new_repo.description = repo["description"]
			new_repo.url = repo["url"]
			new_repo.commits_url = repo["commits_url"].chomp('{/sha}')
			new_repo.pulls_url = repo["pulls_url"].chomp('{/number}')
			new_repo.open_issues_count = repo["open_issues_count"]
			new_repo.github_created_at = repo["created_at"]
			new_repo.organization = org
			new_repo.save
		}

	end

	def create_pull_requests

		repos = org.repos

		repos.each { |repo|
			resp = conn.get URI.parse(URI.encode(repo.pulls_url))
			body = JSON.parse(resp.body)

			next if body.empty?

			body.each { |pull|
				new_pull = PullRequest.find_or_create_by(github_id: pull["id"])
				new_pull.url = pull["url"]
				new_pull.html_url = pull["html_url"]
				new_pull.number = pull["number"]
				new_pull.state = pull["state"]
				new_pull.title = pull["title"]
				new_pull.github_created_at = pull["created_at"]
				new_pull.repo = repo
				new_pull.user_id = create_user(pull["user"]["login"])
				new_pull.save
				puts "saved"
			}
		}
	end

	def create_user(username)
		user = User.find_or_create_by(login: username)

		resp = conn.get URI.parse(URI.encode("users/#{username}"))
		body = JSON.parse(resp.body)

		user.github_id = body["id"]
		user.url = body["url"]
		user.html_url = body["html_url"]
		user.save
		user.id
	end

end