class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cardNumber
      t.date :expDate
      t.string :emisor   
      t.boolean :statuss 
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
