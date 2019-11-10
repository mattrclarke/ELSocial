class MortalityForm  < ApplicationRecord
  belongs_to :lease
  belongs_to :pen
  belongs_to :diver
end
