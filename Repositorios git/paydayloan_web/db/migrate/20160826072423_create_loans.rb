class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :employee_id
      t.float :net_salary
      t.integer :interest
      t.float :max_credit
      t.integer :period
      t.float :capital_requisition
      t.date :date_requisition
      t.float :capital_to_pay
      t.float :balance
      t.string :status

      t.timestamps null: false
    end
  end
end
