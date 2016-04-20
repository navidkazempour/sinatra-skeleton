class User < ActiveRecord::Base

  include BCrypt

  has_many :tracks
  has_many :likes
  has_many :ratings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true
  
  def password
    @password ||= Password.new(self.password_hash) if self.password_hash
  end

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end
end