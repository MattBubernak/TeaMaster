class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.order("RANDOM()").first.try(:decorate)
  end
end
