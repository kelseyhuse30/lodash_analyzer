module Repos
	Query = GithubAPI::Client.parse <<-'GRAPHQL'
	  query {
		  organization(login: "lodash") {
		    url
		    description
		    repositories(first: 5) {
		      edges {
		        node {
		        	id
		          name
		          description
		          createdAt
		        }
		      }
		    }
		  }
		}
	GRAPHQL
end