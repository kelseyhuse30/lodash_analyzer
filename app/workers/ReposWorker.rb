class PullRequestsWorker
  include Sidekiq::Worker
 
  def perform(org)
 		LeadsWorker.perform_async()
  end

end