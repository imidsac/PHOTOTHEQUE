json.array!(@livraisonlogs) do |livraisonlog|
  json.extract! livraisonlog, :id, :date_liv, :achat_id, :produit_id, :qte, :vente_id, :etat, :user_id
  json.url livraisonlog_url(livraisonlog, format: :json)
end
