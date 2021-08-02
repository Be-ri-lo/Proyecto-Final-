class Training < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many :rateds
  has_many :users, through: :rateds
  has_many :partners

  has_many_attached :images

  enum sport: [:Running, :Trekking, :Roller, :Bike, :Climbing, :Surf, :Funcional, :Tenis, :Futbol, :Voleibol, :Slackline, :Birdwatching]
  enum level: [:Básico, :Intermedia, :Avanzada]

  #validates :date_cannot_be_in_the_past
  after_update :average_stars

  # def date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, "must be from today on")
  #   end
  # end 

  def to_s
    self.sport
  end

  def rated?(user)
    !!self.rateds.find{|rate| rate.user_id == user.id}
  end

  def average_stars
    n = self.revisions.pluck(:rating)
    x = self.audits.all.count
    if x > 0 && !n.empty?
      n.sum/x
    else
      0
    end
  end

end
