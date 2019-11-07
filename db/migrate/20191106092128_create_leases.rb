class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.string :location
      t.string :coordinates

      t.timestamps
    end
  end
end
