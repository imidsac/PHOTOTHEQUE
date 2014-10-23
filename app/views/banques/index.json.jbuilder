json.array!(@banques) do |banque|
  json.extract! banque, :id, :nom
  json.url banque_url(banque, format: :json)
end
