class SteepInstructionDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def temperature_string
    object.temperature.to_s + " °C" unless object.temperature.nil?
  end

  def time_string
    object.time.to_s + " MIN" unless object.time.nil?
  end
end
