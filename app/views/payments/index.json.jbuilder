json.array!(@payments) do |payment|
  json.extract! payment, :name, :detail
  json.url payment_url(payment, format: :json)
end
