json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :surname, :curp, :net_monthly_salary, :admission_date, :employee_key, :payment_cycle, :fk_id_card, :company_id
  json.url employee_url(employee, format: :json)
end
