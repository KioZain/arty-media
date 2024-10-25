class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  # Associations-------------------------------

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :collections
  belongs_to :user

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader
end
