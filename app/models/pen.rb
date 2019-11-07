class Pen < ApplicationRecord
  belongs_to :lease
  has_many :mortality_forms
end
