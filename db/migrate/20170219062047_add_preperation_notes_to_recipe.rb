class AddPreperationNotesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :preperation_notes, :string
  end
end
