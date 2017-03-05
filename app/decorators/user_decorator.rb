class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.name.titleize
  end

  def recipe_submitted_count
    Recipe.where(:user_id => object.id).count
  end

  def joined_date
    object.created_at.strftime("%d %b. %Y")
  end


end
