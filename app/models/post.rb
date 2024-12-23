class Post < ApplicationRecord
  validates :title, presence: true
  validates :post_image, presence: true

  # Associations-------------------------------

  has_many :likes, as: :likable
  has_many :comments, dependent: :destroy
  has_many :displays, dependent: :destroy

  accepts_nested_attributes_for :displays

  has_and_belongs_to_many :collections
  belongs_to :user


  acts_as_taggable_on :tags
  acts_as_taggable_on :categories

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }
end
