class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    # Admins can do anything! Everyone else can read anything...
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    # Anyone can manage a recipe that they have created.
    can :manage, Recipe if user.id == :user_id

    # Anyone can create a recipe, if they have an account.
    can :create, Recipe if user.persisted?

    # Anyone can create an ingredient right now.
    can :create, Ingredient if user.persisted?

  end
end
