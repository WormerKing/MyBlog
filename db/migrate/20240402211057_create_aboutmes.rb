class CreateAboutmes < ActiveRecord::Migration[7.1]
  def change
    create_table :aboutmes do |t|
      t.text :body

      t.timestamps
    end
  end
end
