class Repo < ApplicationRecord
	belongs_to :organization
	has_many :pull_requests
end
