class CreateCommunications < ActiveRecord::Migration[7.1]
  def change
    create_table :communications do |t|
      t.string :telephone_number
      t.string :github
      t.string :email

      t.timestamps
    end
  end
end
