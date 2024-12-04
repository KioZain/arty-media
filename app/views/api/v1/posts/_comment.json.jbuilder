json.profile do
  if comment.user&.profile
    json.name comment.user.profile.name
    json.avatar comment.user.profile.avatar.url
  end
end

json.extract! comment, :body
