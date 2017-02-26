class User < ActiveRecord::Base
  acts_as_authentic
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  def is_admin?
    admin
  end
end
