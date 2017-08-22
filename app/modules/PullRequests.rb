module PullRequests
	Query = GithubAPI::Client.parse <<-'GRAPHQL'
	  query {
		  organization(login: "lodash") {
		    repositories(first: 5) {
		      edges {
		        node {
		        	id
		          pullRequests(last: 100) {
		            edges {
		              node {
		                author {
		                  login
		                }
		                state
		                number
		                title
		                id
		          			createdAt
		              }
		            }
		          }
		        }
		      }
		    }
		  }
		}
	GRAPHQL
end