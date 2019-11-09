class CreateLeases < ActiveRecord::Migration[6.0]
  def change
    create_table :leases do |t|
      t.string :location
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
