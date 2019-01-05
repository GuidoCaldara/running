class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true
      t.text :text
      t.string :title
      t.timestamps
    end
  end
end
