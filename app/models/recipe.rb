class Recipe < ActiveRecord::Base
	has_many :ingredient_measurements, dependent: :destroy
  has_many :recipe_reviews, dependent: :destroy
  has_one :steep_instruction, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :steep_instruction
  accepts_nested_attributes_for :ingredient_measurements

  def vote_score
    self.upvotes - self.downvotes
  end

  def vote_count
    self.upvotes + self.downvotes
  end

end
