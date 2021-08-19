class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :training

  enum state: [:undefined, :rejected, :accepted]
end
