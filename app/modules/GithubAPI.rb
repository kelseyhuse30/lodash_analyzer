require "graphql/client"
require "graphql/client/http"

module GithubAPI
  HTTP = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
    def headers(context)
      {
        "Authorization" => "Bearer #{GITHUB_TOKEN}"
      }
    end
  end
  #Used this once to import initial schema into file, now can import from the file
  #Schema = GraphQL::Client.load_schema(HTTP)
  Schema = GraphQL::Client.load_schema("db/schema.json")
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end