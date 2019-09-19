class Post < ApplicationRecord
  belongs_to :profile
  belongs_to :feed
end
