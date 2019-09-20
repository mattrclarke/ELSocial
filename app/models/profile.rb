class Profile < ApplicationRecord
  belongs_to :user
  has_one :feed

  before_save { self.first_name.capitalize! }
  before_save { self.last_name.capitalize! }


  def full_name
    "#{self.first_name} #{self.last_name}".split.map(&:capitalize).join(' ')
  end
  
  private

end
