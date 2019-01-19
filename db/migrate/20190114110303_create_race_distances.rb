class CreateRaceDistances < ActiveRecord::Migration[5.2]
  def change
    create_table :race_distances do |t|
      t.string :distance_type
      t.string :label
      t.timestamps
    end
  end
end
