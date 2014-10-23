json.array!(@employes) do |employe|
  json.extract! employe, :id, :nom, :prenom, :sexe, :phone, :address, :email, :compte_banc, :salaireb, :type, :date_recru
  json.url employe_url(employe, format: :json)
end
