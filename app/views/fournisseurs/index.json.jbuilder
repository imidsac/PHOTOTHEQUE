json.array!(@fournisseurs) do |fournisseur|
  json.extract! fournisseur, :id, :name_company, :nom, :prenom, :phone, :address, :email
  json.url fournisseur_url(fournisseur, format: :json)
end
