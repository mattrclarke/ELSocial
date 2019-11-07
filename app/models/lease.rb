class Lease < ApplicationRecord
  has_many :pens
  has_many :mortality_forms
end
