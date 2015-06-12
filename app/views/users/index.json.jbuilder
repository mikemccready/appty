json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :first_namelast_name, :email, :phone_number, :image, :password_digest, :provider
  json.url user_url(user, format: :json)
end
