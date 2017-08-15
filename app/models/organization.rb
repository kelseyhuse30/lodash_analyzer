class Organization < ApplicationRecord
	has_many :repos
	has_many :pull_requests, through: :repos
end
