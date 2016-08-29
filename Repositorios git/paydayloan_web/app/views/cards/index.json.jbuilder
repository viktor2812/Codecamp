json.array!(@cards) do |tarjeta|
  json.extract! tarjeta, :id, :cardNumber, :expDate, :emisor, :statuss
  json.url card_url(tarjeta, format: :json)
end
