json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :provider_id, :user_id, :start_time, :end_time, :location, :availability
  json.url appointment_url(appointment, format: :json)
end
