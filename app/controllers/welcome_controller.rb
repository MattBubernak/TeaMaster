class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.order("RANDOM()").first.try(:decorate)
    @post = Post.last.try(:decorate)
  end
end
