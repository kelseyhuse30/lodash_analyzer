class PullRequest < ApplicationRecord
	belongs_to :organization, through: :repo
	belongs_to :repo
	has_one :user
end
