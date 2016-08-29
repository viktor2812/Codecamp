class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :surname
      t.string :curp
      t.float :net_monthly_salary
      t.date :admission_date
      t.integer :employee_key
      t.integer :payment_cycle
      t.integer :fk_id_card
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
