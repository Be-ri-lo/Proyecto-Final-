class Training < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_many :rateds
  has_many :partners

  has_many_attached :images

  enum sport: [:Running, :Trekking, :Roller, :Bike, :Climbing, :Surf, :Funcional, :Tenis, :Futbol, :Voleibol, :Slackline, :Birdwatching]
  enum level: [:Básico, :Intermedia, :Avanzada]

  def to_s
    self.sport
  end

  def rated?(user)
    !!self.rateds.find{|rate| rate.user_id == user.id}
  end
end
