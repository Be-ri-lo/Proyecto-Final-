class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :trainings
  
  # has_many :partners
  # has_many :friends, -> { where partners: { state: :accepted }}, through: :partners
  # has_many :requested_friends, -> { where partners: { state: :requested }}, through: :partners, source: :friend
  # has_many :pending_friends, -> { where partners: { state: :pending }}, through: :partners, source: :friend
  # has_many :blocked_friends, -> { where partners: { state: :blocked }}, through: :partners, source: :friend


  
  def to_s
    self.name 
  end


  def has_partner?(friend)
    return true if self == friend
    partners.map(&:friend_id).include?(friend.id)
  end

  # def requested_friends_with?(friend)
  #   return false if self == friend
  #   requested_friends.map(&:id).include?(friend.id)
  # end
  
  def pending_friends_with?(friend)
    return false if self == friend
    pending_friends.map(&:id).include?(friend.id)
  end
  
  def friends_with?(friend)
    return false if self == friend
    friends.map(&:id).include?(friend.id)
  end
    
  def friend_request(friend)
    unless self == friend || Partner.where(user: self, friend: friend).exists?
      transaction do
        Partner.create(user: self, friend: friend, state: :pending)
        Partner.create(user: friend, friend: self, state: :requested)
      end
    end
  end

  def accept_request(friend)
    transaction do
      Partner.find_by(user: self, friend: friend, state: [:requested])&.accepted!
      Partner.find_by(user: friend, friend: self, state: [:pending])&.accepted!
    end
  end

  def reject_request(friend)
    transaction do
      Partner.find_by(user: self, friend: friend)&.destroy!
      Partner.find_by(user: friend, friend: self)&.destroy!
    end
  end
  
end

