json.array!(@ventes) do |vente|
  json.extract! vente, :id, :boutique_id, :client_id, :clients, :date_vente, :etat_vente, :somme, :payee, :type, :etat_vente
  json.url vente_url(vente, format: :json)
end
