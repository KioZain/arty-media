class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  has_many :comments, dependent: :destroy
  mount_uploader :post_image, PostImageUploader
end
