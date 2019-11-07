class CreatePens < ActiveRecord::Migration[6.0]
  def change
    create_table :pens do |t|
      t.string :name
      t.references :lease, null: false, foreign_key: true

      t.timestamps
    end
  end
end
