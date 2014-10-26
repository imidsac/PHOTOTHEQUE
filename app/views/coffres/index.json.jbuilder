json.array!(@coffres) do |coffre|
  json.extract! coffre, :id, :paiement, :font
  json.url coffre_url(coffre, format: :json)
end
