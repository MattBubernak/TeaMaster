class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_recipe_id, :integer
    add_column :users, :about, :string
    add_column :users, :gender, :integer
  end
end
