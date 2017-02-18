class Recipe < ActiveRecord::Base
	has_many :ingredient_measurements, dependent: :destroy
  has_one :steep_instruction, dependent: :destroy
  accepts_nested_attributes_for :steep_instruction
end
