class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  # Associations-------------------------------

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :collections
  belongs_to :user
  acts_as_taggable_on :tags

  # ImagesUploader----------------------------
  mount_uploader :post_image, PostImageUploader


  default_scope { order(created_at: "DESC") }

  def as_json
    {
      title: title,
      body: body,
      auuthor: author

    }
  end
end
