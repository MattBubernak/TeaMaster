class IngredientMeasurementDecorator < Draper::Decorator
  delegate_all
  decorates_association :ingredient

  def count_with_units_string
    h.pluralize(count,unit_type) unless count.nil? || unit_type.nil?
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
