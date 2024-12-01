# json.partial! "api/v1/posts/post", post: @post
json.extract! @post, :id, :title, :body, :tag_list, :post_image

json.set! :comments do
  json.array! @post.comments, partial: "api/v1/posts/comment", as: :comment
end
