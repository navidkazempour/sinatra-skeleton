class User < ActiveRecord::Base

  has_many :tracks
  belongs_to :love

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  
end