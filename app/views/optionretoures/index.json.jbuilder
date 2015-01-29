json.array!(@optionretoures) do |optionretoure|
  json.extract! optionretoure, :id, :name, :description, :user_id
  json.url optionretoure_url(optionretoure, format: :json)
end
