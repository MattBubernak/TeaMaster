class CreateRecipeReviews < ActiveRecord::Migration
  def change
    create_table :recipe_reviews do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
