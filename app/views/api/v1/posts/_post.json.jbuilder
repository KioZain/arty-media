json.extract! post, :title, :body, :tag_list, :post_image

json.profile do
  json.name post.user.profile.name if post.user&.profile
end

# json.url post_url(post)
