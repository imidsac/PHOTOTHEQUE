json.array!(@tcoffres) do |tcoffre|
  json.extract! tcoffre, :id, :date_tc, :beneficier, :type_tc
  json.url tcoffre_url(tcoffre, format: :json)
end
