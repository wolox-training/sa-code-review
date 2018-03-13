class AddGithubRepositoryToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :github_repository, :string
  end
end
