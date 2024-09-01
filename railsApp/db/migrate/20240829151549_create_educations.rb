class CreateEducations < ActiveRecord::Migration[7.2]
  def change
    create_table :educations do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.float :average_grade
      t.string :learned, array: true, default: []

      t.timestamps
    end
  end
end
