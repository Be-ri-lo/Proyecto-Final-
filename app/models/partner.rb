class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :training

  enum state: %i[undefined rejected accepted]
end
