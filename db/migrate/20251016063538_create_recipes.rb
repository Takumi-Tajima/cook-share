class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :cooking_time, null: false
      t.string :difficulty, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
