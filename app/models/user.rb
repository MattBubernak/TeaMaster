class User < ActiveRecord::Base
  acts_as_authentic
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  enum gender: [ :male, :female]
  has_many :recipes
  def is_admin?
    admin
  end
end
