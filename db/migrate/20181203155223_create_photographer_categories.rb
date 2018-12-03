class CreatePhotographerCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :photographer_categories do |t|
      t.references :category, foreign_key: true
      t.references :photographer, foreign_key: true

      t.timestamps
    end
  end
end
