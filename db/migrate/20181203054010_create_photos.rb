class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true
      t.boolean :organisation, default: false
      t.string :description
      t.string :image
      t.timestamps
    end
  end
end
