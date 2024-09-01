class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :features, array: true, default: []
      t.string :technologies, array: true, default: []
      
      t.timestamps
    end
  end
end
