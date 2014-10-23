json.array!(@articles) do |article|
  json.extract! article, :id, :name, :reference, :etat
  json.url article_url(article, format: :json)
end
