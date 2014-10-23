json.array!(@alignes) do |aligne|
  json.extract! aligne, :id, :achat_id, :qte, :qtelivre, :montant, :etat
  json.url aligne_url(aligne, format: :json)
end
