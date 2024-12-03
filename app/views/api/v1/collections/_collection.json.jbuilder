json.extract! collection, :id, :title, :body

json.user do
  json.email collection.user.email
end

json.url collection_url(collection)
