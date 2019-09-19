class Profile < ApplicationRecord
  belongs_to :user
  has_one :feed

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

end
