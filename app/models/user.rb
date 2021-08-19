class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trainings
  has_many :partners
  
  def to_s
    self.name 
  end

  def total_partners
    self.partners.count
  end

  def suggest_partners
    current_partners_id = self.partners.map{|f| f.partner_id}
    current_partners_id.push(self.id)
    @suggest = User.where.not(id: current_partners_id)
  end
  
end
