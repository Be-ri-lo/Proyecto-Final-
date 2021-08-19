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
  def apply_training
     
  end

  def total_partners
    self.partners.count
  end

  def suggest_friends
    current_friends_id = self.friends.map{|f| f.friend_id}
    current_friends_id.push(self.id)
    @suggest = User.where.not(id: current_friends_id)
  end

  # Si el entrenamiento terminó, puedes evaluar
  def concluded?
     self.date < Date.today
  end

  #Entregar evaluacion
  def average_stars
    n = self.rateds.pluck(:rateds)
    x = self.rateds.all.count
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

  # def search_data
  #   {
  #        country: country,
  #        city: city,
  #        location: location, null: false,
  #        sport: sport, null: false,
  #        level: level, null: false,
  #        date: date
  #   }
  # end

  

end
