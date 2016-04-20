class Track < ActiveRecord::Base

  belongs_to :user
  has_many :likes
  has_many :ratings

  validates :song_title, presence: true, length: { maximum: 250 }
  validates :author, presence: true, length: { maximum: 50, message: "Too long!!!" }
  validates :user_id, presence: { message: "Login first"}

end