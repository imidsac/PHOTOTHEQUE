json.array!(@caisses) do |caiss|
  json.extract! caiss, :id, :paiement, :font
  json.url caiss_url(caiss, format: :json)
end
