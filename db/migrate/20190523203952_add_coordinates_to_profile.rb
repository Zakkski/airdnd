class AddCoordinatesToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :latitude, :float
    add_column :profiles, :longitude, :float
  end
end
