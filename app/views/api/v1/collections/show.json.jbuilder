json.extract! @collection, :id, :title, :body

json.set! :posts do
  json.array! @collection.posts, partial: "api/v1/posts/post", as: :post
end
