# json.partial! "api/v1/posts/post", post: @post
json.extract! @post, :id, :title, :body, :tag_list, :post_image, :price, :city, :amount

json.set! :comments do
  json.array! @post.comments, partial: "api/v1/posts/comment", as: :comment
end

json.set! :displays do
  json.array! @post.displays, partial: "api/v1/displays/display", as: :display
end
