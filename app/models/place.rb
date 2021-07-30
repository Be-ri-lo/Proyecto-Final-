class Place < ApplicationRecord
    has_many :trainings

    scope :active, ->{ where(active: true) }

def to_s
    self.location    
end

end
