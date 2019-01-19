class CreateRaceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :race_types do |t|
      t.string :typology

      t.timestamps
    end
  end
end
