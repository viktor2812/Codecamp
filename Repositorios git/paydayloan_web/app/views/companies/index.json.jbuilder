json.array!(@companies) do |company|
  json.extract! company, :id, :company_name, :sub_company, :calendar_schema, :payment_schema, :contact_name, :contact_email, :contact_telephone
  json.url company_url(company, format: :json)
end
