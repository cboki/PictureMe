class AddCoordinatesToPhotographer < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :latitude, :float
    add_column :photographers, :longitude, :float
  end
end
