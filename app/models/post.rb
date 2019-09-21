class Post < ApplicationRecord
  belongs_to :feed
  belongs_to :user
  mount_uploader :image, ImageUploader
end
