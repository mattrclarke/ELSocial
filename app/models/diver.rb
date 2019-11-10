class Diver < ApplicationRecord
  has_many :mortality_forms



  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def initials
    "#{self.first_name.first}#{self.last_name.first}"
  end

end
