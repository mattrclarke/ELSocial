class Profile < ApplicationRecord
  belongs_to :user
  has_one :feed
  mount_uploader :image, ImageUploader


  def full_name
    "#{self.first_name} #{self.last_name}".split.map(&:capitalize).join(' ')
  end

  private

end
