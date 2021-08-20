class Training < ApplicationRecord
  #searchkick word_start: [:sport]

  belongs_to :user
  belongs_to :place

  has_many :rateds
  #has_many :users, through: :rateds
  has_many :partners

  has_many_attached :images

  enum sport: [:Running, :Trekking, :Roller, :Bike, :Climbing, :Surf, :Funcional, :Tenis, :Futbol, :Voleibol, :Slackline, :Birdwatching]
  enum level: [:Básico, :Intermedia, :Avanzada]

  #validates :date_cannot_be_in_the_past
  audited only: :rating, on: [:update, :destroy]
  after_update :average_stars

  # def date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, "must be from today on")
  #   end
  # end 

  def to_s
    self.sport
  end

  #Pides solicitud de entrenamiento (partner)
  
  def suggest_partners
      current_partners_id = self.partners.map{|f| f.partner_id}
      current_partners_id.push(self.id)
      @suggest = User.where.not(id: current_partners_id)
  end

  def partner_list
    users = self.partners.map{|f| f.partner_id}
    users.push(self.id)
    return users
  end

  def follow?(user)
    return (partners.where('partner_id=?', user).count == 1)
  end

  # Si el entrenamiento terminó, puedes evaluar
  def concluded?
     self.date < Date.today
  end

  #Entregar evaluacion

  def average_stars
    n = self.revisions.pluck(:rating)
    x = self.audits.all.count
    if x > 0 && !n.empty?
      n.sum/x
    else
      0
    end
  end
  
  # Si fue evaluado, no evaluarlo de nuevo
  def rated?(user)
    !!self.rateds.find{|rate| rate.user_id == user.id}
  end

  # Kaminari
  paginates_per 15
end
