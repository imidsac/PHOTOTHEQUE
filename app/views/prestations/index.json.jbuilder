json.array!(@prestations) do |prestation|
  json.extract! prestation, :id, :client_id, :employe_id, :date_perstation, :etat_prestation, :somme, :payee
  json.url prestation_url(prestation, format: :json)
end
