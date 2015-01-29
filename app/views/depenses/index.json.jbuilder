json.array!(@depenses) do |depense|
  json.extract! depense, :id, :description, :categoriedep_id, :montant, :etat
  json.url depense_url(depense, format: :json)
end
