class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :status
      t.string :location
      t.references :photographer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
