class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
    	t.string, :login
    	t.string, :url
    	t.string, :repos_url
    	t.string, :description
    	t.string, :name
    	t.string, :public_repos
    	t.string, :html_url
    	t.datetime, :github_created_at
      t.timestamps
    end
  end
end
