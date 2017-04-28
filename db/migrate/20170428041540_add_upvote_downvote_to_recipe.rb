class AddUpvoteDownvoteToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :upvotes, :integer, :default => 0
    add_column :recipes, :downvotes, :integer, :default => 0
  end
end
