class Rating < ActiveRecord::Base
  
  belongs_to :track
  belongs_to :user

  validates :rate, numericality: { greater_than_or_equal_to: 0 }

end