class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :race_type
      t.integer :distance_km
      t.string :location
      t.text :description
      t.string :distance_type
      t.string :website
      t.string :subscription_link
      t.string :season
      t.float :latitude
      t.integer :elevation
      t.float :longitude
      t.integer :first_price
      t.date :first_edition
      t.date :first_price_start
      t.date :first_price_end
      t.integer :second_price
      t.date :second_price_start
      t.date :second_price_end
      t.integer :third_price
      t.date :third_price_start
      t.date :third_price_end
      t.string :instagram_page
      t.string :facebook_page
      t.string :video
      t.date :next_edition_date
      t.date :subscription_start
      t.date :subscription_end
      t.text :goodies
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
