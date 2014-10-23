json.array!(@clients) do |client|
  json.extract! client, :id, :nom, :prenom, :phone, :address, :email
  json.url client_url(client, format: :json)
end
