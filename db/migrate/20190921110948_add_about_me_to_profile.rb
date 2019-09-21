class AddAboutMeToProfile < ActiveRecord::Migration[6.0]
  def change
     add_column :profiles, :about_me, :text
     add_column :profiles, :image, :string
  end
end
