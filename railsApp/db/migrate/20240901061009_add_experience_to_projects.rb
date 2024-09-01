class AddExperienceToProjects < ActiveRecord::Migration[7.2]
  def change
    add_reference :projects, :experience, null: true, foreign_key: true
  end
end
