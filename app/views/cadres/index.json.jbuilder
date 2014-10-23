json.array!(@cadres) do |cadre|
  json.extract! cadre, :id, :numerobaguete, :info
  json.url cadre_url(cadre, format: :json)
end
