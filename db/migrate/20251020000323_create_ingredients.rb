class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false, foreign_key: true, index: false
      t.string :name
      t.integer :amount

      t.timestamps
      t.index %i[recipe_id name], unique: true
    end
  end
end
