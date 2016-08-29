class CreateDestroyers < ActiveRecord::Migration
  def change
    create_table :destroyers do |t|
      t.string :card

      t.timestamps null: false
    end
  end
end
