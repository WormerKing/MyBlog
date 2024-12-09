class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :header
      t.json :content
      t.integer :view_count, default: 0
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
