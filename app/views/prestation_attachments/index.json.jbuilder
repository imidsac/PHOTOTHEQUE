json.array!(@prestation_attachments) do |prestation_attachment|
  json.extract! prestation_attachment, :id, :prestation_id, :photo
  json.url prestation_attachment_url(prestation_attachment, format: :json)
end
