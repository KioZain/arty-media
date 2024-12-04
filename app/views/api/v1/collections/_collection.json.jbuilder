json.extract! collection, :title, :body

json.profile do
  json.name collection.user.profile.name if collection.user&.profile
end

# json.url collection_url(collection)
