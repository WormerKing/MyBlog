class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :header
      t.text :body
      t.string :url
      t.integer :view_count, default: 0
      t.date :start_date
      t.date :end_date
      t.belongs_to :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
