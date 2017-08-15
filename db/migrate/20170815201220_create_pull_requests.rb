class CreatePullRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :pull_requests do |t|
    	t.string :github_id,
    	t.string :html_url,
    	t.string :url,
    	t.string :number,
    	t.string :state,
    	t.string :title,
    	t.string :user_id,
    	t.datetime :github_created_at,
      t.timestamps
    end
  end
end
