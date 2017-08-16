task :watch_prs => :environment do
	desc 'Watch for new PRs for specific org every 2hr'
	puts "What is the name of the org you want to watch for new pull requests?"
	org_name = $stdin.gets
	org = Org.find_or_create_by(name: org_name)
	ReposWorker.perform_async(org)
end