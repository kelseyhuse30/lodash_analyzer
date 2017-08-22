require 'graphql/client'
require 'graphql/client/http'

task :import_graphql_schema => :environment do
	require File.join(Rails.root, 'app', 'modules', 'GithubAPI.rb')
	include GithubAPI
	desc 'Import github graphql schema into a local file'
	puts "Import begins now"

	GraphQL::Client.dump_schema(GithubAPI::HTTP, "db/schema.json")
	puts "Import complete"
end