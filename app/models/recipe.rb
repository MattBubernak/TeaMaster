class Recipe < ActiveRecord::Base
	has_many :ingredient_measurements, dependent: :destroy
end
