class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  default_scope { order(created_at: "DESC") }
end
