class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.string :name
      t.string :latitude
      t.string :lon

      t.timestamps
    end
  end
end
