module Org
	Query = GithubAPI::Client.parse <<-'GRAPHQL'
	  query {
	    organization(login: "lodash") {
	      description
	    }
	  }
	GRAPHQL
end