json.array!(@monetaires) do |monetaire|
  json.extract! monetaire, :id, :money, :valeur
  json.url monetaire_url(monetaire, format: :json)
end
