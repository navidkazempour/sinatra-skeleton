class Track < ActiveRecord::Base

  belongs_to :user
  belongs_to :love

  validates :song_title, presence: true, length: { maximum: 250 }
  validates :author, presence: true, length: { maximum: 50, message: "Too long!!!" }

end