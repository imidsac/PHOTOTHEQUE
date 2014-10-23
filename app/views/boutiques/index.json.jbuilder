json.array!(@boutiques) do |boutique|
  json.extract! boutique, :id, :name, :phone, :address
  json.url boutique_url(boutique, format: :json)
end
