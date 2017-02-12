class AddImageToIngredient < ActiveRecord::Migration
  def up
    add_attachment :ingredients, :img
  end

  def down
    remove_attachment :ingredients, :img
  end
end
