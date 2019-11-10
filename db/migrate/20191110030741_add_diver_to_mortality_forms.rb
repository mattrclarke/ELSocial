class AddDiverToMortalityForms < ActiveRecord::Migration[6.0]
  def change
      add_reference :mortality_forms, :diver, index: true
  end
end
