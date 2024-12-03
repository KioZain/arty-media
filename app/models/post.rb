class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :post_image, presence: true
  # Associations-------------------------------

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :collections
  belongs_to :user
  acts_as_taggable_on :tags

  has_many :displays, dependent: :destroy
  accepts_nested_attributes_for :displays

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }

  # def as_json
  #   {
  #     user_id: user_id,
  #     author: author,
  #     title: title,
  #     body: body


  #   }
  # end
end
