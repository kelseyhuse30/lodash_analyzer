require 'pry'

task :import_graphql => :environment do
	desc 'Import github repo and pull request data for lodash'
	puts 'Import begins now'
	service = GithubGraphqlService.new
	service.get_org
	service.get_repos
	service.get_pull_requests
	puts 'Import complete'
	puts "#{PullRequest.all.count} pull requests saved"
end