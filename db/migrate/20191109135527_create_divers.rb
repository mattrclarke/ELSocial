class CreateDivers < ActiveRecord::Migration[6.0]
  def change
    create_table :divers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact
      t.string :address
      t.string :secondary_contact

      t.timestamps
    end
  end
end
