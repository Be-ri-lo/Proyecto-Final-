class Place < ApplicationRecord
    has_many :trainings

def to_s
    self.location    
end

end
