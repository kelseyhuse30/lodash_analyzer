task :import => :environment do
	desc 'Import github repo and pull request data for an org'
	puts "What is the name of the org you want to import pull request info about?"
	org_name = $stdin.gets
	# org = Org.find_or_create_by(name: org_name)
	# GithubService.populate_prs(org)
	# puts "#{org.name} created with:"
	# puts "#{org.repos.count} repositories"
	# puts "#{org.pull_requests.count} pull requests"
end