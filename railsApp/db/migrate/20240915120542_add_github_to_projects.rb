class AddGithubToProjects < ActiveRecord::Migration[7.2]
  def change
    add_column :projects, :github, :string
  end
end
