class User < ApplicationRecord
	has_many :pull_requests
end
