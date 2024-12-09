class CreateProjectImages < ActiveRecord::Migration[7.1]
  def change
    create_table :project_images do |t|
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
