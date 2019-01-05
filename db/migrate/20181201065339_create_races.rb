class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :race_type
      t.integer :distance_km
      t.string :location
      t.string :description
      t.string :distance_type
      t.string :website
      t.string :subscription_link
      t.string :season
      t.float :latitude
      t.integer :elevation
      t.float :longitude
      t.integer :price
      t.date :date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
