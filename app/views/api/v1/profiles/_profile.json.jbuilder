json.extract! profile, :id, :name, :bio, :avatar
json.user do
  json.email profile.user.email
end

json.url profile_url(profile)
