json.array!(@achats) do |achat|
  json.extract! achat, :id, :fournisseur_id, :date_achat, :type, :somme, :payee, :etat_achat
  json.url achat_url(achat, format: :json)
end
