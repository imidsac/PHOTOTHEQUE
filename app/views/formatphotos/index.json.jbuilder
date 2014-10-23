json.array!(@formatphotos) do |formatphoto|
  json.extract! formatphoto, :id, :dimention, :info
  json.url formatphoto_url(formatphoto, format: :json)
end
