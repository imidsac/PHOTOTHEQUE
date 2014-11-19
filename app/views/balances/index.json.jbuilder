json.array!(@balances) do |balance|
  json.extract! balance, :id, :exercice, :mois, :achats, :depenses, :ventes, :tva
  json.url balance_url(balance, format: :json)
end
