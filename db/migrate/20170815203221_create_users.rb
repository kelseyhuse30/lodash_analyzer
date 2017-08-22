class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :github_id
      t.string :login
      t.string :url
      t.string :html_url

      t.timestamps
    end
  end
end
