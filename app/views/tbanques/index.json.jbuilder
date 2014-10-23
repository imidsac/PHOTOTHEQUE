json.array!(@tbanques) do |tbanque|
  json.extract! tbanque, :id, :banque_id, :type_rv, :montant, :porteur
  json.url tbanque_url(tbanque, format: :json)
end
