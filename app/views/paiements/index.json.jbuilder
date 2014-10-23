json.array!(@paiements) do |paiement|
  json.extract! paiement, :id, :vente_id, :client_id, :achat_id, :fournisseur_id, :datepaiement, :motif, :montant
  json.url paiement_url(paiement, format: :json)
end
