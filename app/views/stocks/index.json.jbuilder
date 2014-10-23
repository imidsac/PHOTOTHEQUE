json.array!(@stocks) do |stock|
  json.extract! stock, :id, :cadre_id, :article_id, :stoc
  json.url stock_url(stock, format: :json)
end
