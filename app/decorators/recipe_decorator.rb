class RecipeDecorator < Draper::Decorator
  delegate_all
  decorates_association :ingredient_measurement

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def ld_json
    ld_json = {
      "@context" => "http://schema.org",
      "@type" => "Recipe",
      "name" => object.name,
      "author" => object.user.name,
      "description" => object.description,
      "image" => "http://herbalteamaster.com/images/missing-ingredient.png",
      "aggregateRating" => {
        "@type" => "AggregateRating",
        "ratingValue" => average_rating,
        "reviewCount" => object.recipe_reviews.count
      },
      "recipeIngredient" => object.ingredient_measurements.map{|measurement| measurement.ingredient.name},
      "recipeInstructions" => [
        object.preperation_notes
      ]
    }
    '<script type="application/ld+json">' +
    ld_json.to_json +
    '</script>'.html_safe
  end

  def name
    object.name.titleize
  end

  def vote_score_string
    sprintf("%+d", object.vote_score)
  end

  def vote_count_string
    "#{ActionController::Base.helpers.pluralize(object.vote_count,'vote')} votes casted."
  end

  def link_to_recipe
    h.recipe_url(object.id)
  end

  def ingredient_list_string
    object.ingredient_measurements.decorate.map{ |i| i.ingredient.name}.join(" - ")
  end

  def description_truncated
    ActionController::Base.helpers.truncate(object.description, :length => 200, :separator => /\w/, :omission => "...")
  end

  def created_date
    object.created_at.strftime("%d %b. %Y")
  end

  def preperation_notes
    object.preperation_notes.present? ? object.preperation_notes : "None"
  end

  def submitter_username
    object.user.username if object.user.present?
  end

  def average_rating
    return nil unless object.recipe_reviews.count > 0
    object.recipe_reviews.map{ |review| review.rating }.reduce(:+) / object.recipe_reviews.count
  end

  def review_count
    object.recipe_reviews.count
  end

  def reviews_description
    if object.recipe_reviews.count == 0
      "Be the first to review this recipe!"
    else
      "This recipe has an average rating of #{average_rating} over #{review_count} reviews."
    end
  end

end
