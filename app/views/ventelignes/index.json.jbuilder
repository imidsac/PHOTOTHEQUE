json.array!(@ventelignes) do |venteligne|
  json.extract! venteligne, :id, :vente_id, :qte, :qtelivre, :montant, :etat
  json.url venteligne_url(venteligne, format: :json)
end
