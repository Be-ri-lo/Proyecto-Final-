class Rated < ApplicationRecord
  belongs_to :user
  belongs_to :training

 
  def blank_stars
    5 - rating.to_i
  end
  
end
