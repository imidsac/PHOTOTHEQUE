json.array!(@prestationlignes) do |prestationligne|
  json.extract! prestationligne, :id, :prestation_id, :qte, :qtelivre, :montant, :numero_prise, :type, :etat
  json.url prestationligne_url(prestationligne, format: :json)
end
