class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
    	t.string :github_id,
    	t.string :name,
    	t.string :html_url,
    	t.string :description,
    	t.string :url,
    	t.string :commits_url,
    	t.string :pulls_url,
    	t.string :open_issues_count,
    	t.datetime :github_created_at,
      t.timestamps
    end
  end
end
