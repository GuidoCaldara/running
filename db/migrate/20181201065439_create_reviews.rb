class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true
      t.text :text
      t.string :title
      t.integer :path_rate
      t.integer :organisation_rate
      t.integer :overall_rate
      t.timestamps
    end
  end
end
