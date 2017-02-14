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

  def name
    object.name.titleize
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



end
