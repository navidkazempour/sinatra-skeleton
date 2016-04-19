class Track < ActiveRecord::Base

  validates :song_title, presence: true, length: { maximum: 250 }
  validates :author, presence: true, length: { maximum: 50, message: "Too long!!!" }
  # validates :url, :format => { }

end