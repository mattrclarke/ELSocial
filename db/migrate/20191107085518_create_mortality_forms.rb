class CreateMortalityForms < ActiveRecord::Migration[6.0]
  def change
    create_table :mortality_forms do |t|
      t.date :date
      t.integer :bird_strikes
      t.integer :seal_strikes
      t.integer :skinny
      t.integer :deformities
      t.integer :unknown
      t.text :mort_comments
      t.integer :shallow_rot
      t.integer :deep_rot
      t.integer :missing_weights
      t.string :skin_burn
      t.integer :fish_rub
      t.integer :probe_cleaned
      t.text :observations
      t.references :pen, null: false, foreign_key: true
      t.references :lease, null: false, foreign_key: true
      t.timestamps
    end
  end
end
