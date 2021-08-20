class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum state: [:pending, :requested, :accepted, :blocked]
end
