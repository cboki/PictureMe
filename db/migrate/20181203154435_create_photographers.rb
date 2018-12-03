class CreatePhotographers < ActiveRecord::Migration[5.2]
  def change
    create_table :photographers do |t|
      t.string :location
      t.text :description
      t.string :language
      t.integer :daily_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
