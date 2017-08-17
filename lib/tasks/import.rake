task :import => :environment do
	desc 'Import github repo and pull request data for an org'
	puts "What is the name of the org you want to import pull request info about?"
	org_name = $stdin.gets.chomp
	service = GithubService.new(org_name)
	service.create_org
	service.create_repos
	service.create_pull_requests
end