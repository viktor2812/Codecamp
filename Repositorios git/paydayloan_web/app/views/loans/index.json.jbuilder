json.array!(@loans) do |loan|
  json.extract! loan, :id, :employee_id, :net_salary, :interest, :max_credit, :period, :capital_requisition, :date_requisition, :capital_to_pay, :balance, :status
  json.url loan_url(loan, format: :json)
end
