class RecipeReview < ActiveRecord::Base
  validates_uniqueness_of :recipe_id, :scope => :user_id
  belongs_to :recipe
  belongs_to :user
end

