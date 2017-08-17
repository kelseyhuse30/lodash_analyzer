class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|    	
      t.integer :github_id
      t.integer :organization_id
    	t.string :name
    	t.string :html_url
    	t.string :description
    	t.string :url
    	t.string :commits_url
    	t.string :pulls_url
    	t.integer :open_issues_count
    	t.datetime :github_created_at
      t.timestamps
    end
  end
end
