class IngredientDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def name
    object.name.titleize
  end

  def link_to_ingredient
    h.ingredient_url(object.id)
  end

  def description_truncated
    ActionController::Base.helpers.truncate(object.description, :length => 75, :separator => /\w/, :omission => "...")
  end
end
