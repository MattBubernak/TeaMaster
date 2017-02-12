class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.order("RANDOM()").first.decorate
  end
end
