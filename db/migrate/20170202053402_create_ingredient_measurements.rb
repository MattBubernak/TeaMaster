class CreateIngredientMeasurements < ActiveRecord::Migration
  def change
    create_table :ingredient_measurements do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true
      t.integer :count
      t.string :unit_type

      t.timestamps null: false
    end
  end
end
