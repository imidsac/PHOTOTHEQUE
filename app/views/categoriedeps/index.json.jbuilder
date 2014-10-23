json.array!(@categoriedeps) do |categoriedep|
  json.extract! categoriedep, :id, :name, :description
  json.url categoriedep_url(categoriedep, format: :json)
end
