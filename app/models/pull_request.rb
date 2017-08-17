class PullRequest < ApplicationRecord
	has_one :organization, through: :repo
	belongs_to :repo
	has_one :user
end
