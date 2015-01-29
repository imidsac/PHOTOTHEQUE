json.array!(@banques) do |banque|
  json.extract! banque, :id, :nom, :compte, :solde
  json.url banque_url(banque, format: :json)
end
