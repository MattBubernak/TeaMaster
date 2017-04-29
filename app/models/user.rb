class User < ActiveRecord::Base
  acts_as_authentic
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  enum gender: [ :male, :female]
  has_many :recipes
  has_many :posts
  def is_admin?
    admin
  end
end
