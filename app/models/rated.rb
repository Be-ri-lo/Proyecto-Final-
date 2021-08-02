class Rated < ApplicationRecord
  belongs_to :user
  belongs_to :training

  # def concluded?
  #   if training.date < Date.today
  #    end
  # end

  def blank_stars
    5 - rating.to_i
  end
  
end
