json.extract! post, :id, :title, :body, :tag_list, :post_image

json.user do
  json.email post.user.email
end

json.url post_url(post)