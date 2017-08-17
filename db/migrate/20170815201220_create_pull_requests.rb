class CreatePullRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :pull_requests do |t|
    	t.integer :github_id
      t.integer :repo_id
      t.integer :user_id
      t.string :html_url
    	t.string :url
    	t.integer :number
    	t.string :state
    	t.string :title
    	t.datetime :github_created_at
      t.timestamps
    end
  end
end
