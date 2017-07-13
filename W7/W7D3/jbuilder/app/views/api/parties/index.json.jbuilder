json.array! @parties do |party|
  json.partial! 'api/parties/party', party: party
end
