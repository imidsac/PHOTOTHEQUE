json.array!(@retourelogs) do |retourelog|
  json.extract! retourelog, :id, :date_re, :produit_id, :qte, :optionretoure_id, :achat_id, :vente_id, :motif, :user_id
  json.url retourelog_url(retourelog, format: :json)
end
