class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :sub_company
      t.integer :calendar_schema
      t.string :payment_schema
      t.string :contact_name
      t.string :contact_email
      t.string :contact_telephone

      t.timestamps null: false
    end
  end
end
