class MortalityForm < ApplicationRecord
  belongs_to :lease
  belongs_to :pen
end
