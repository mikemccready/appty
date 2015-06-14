json.array!(@providerships) do |providership|
  json.extract! providership, :id, :user_id, :provider_id
  json.url providership_url(providership, format: :json)
end
