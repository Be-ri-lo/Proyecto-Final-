class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trainings
  # has_many :rateds
  # has_many :trainings, through: :rateds, dependent: :destroy

  # has_many :partners
  # has_many :trainings, through: :partners, dependent: :destroy

  has_one :profile

  validates :name, presence: true

  def to_s
    self.name 
  end
  
end
