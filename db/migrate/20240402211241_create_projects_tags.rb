class CreateProjectsTags < ActiveRecord::Migration[7.1]
  def change
    create_table :projects_tags do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
