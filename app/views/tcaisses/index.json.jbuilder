json.array!(@tcaisses) do |tcaiss|
  json.extract! tcaiss, :id, :date_tc, :crencier, :type
  json.url tcaiss_url(tcaiss, format: :json)
end
