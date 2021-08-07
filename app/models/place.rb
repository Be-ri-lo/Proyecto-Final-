class Place < ApplicationRecord
    searchkick word_start: [:location]

    has_many :trainings

    scope :active, ->{ where(active: true) }

    def to_s
        self.location    
    end

    def search_data
       {
            country: country,
            city: city,
            location: location, null: false,
            sport: sport, null: false,
            level: level, null: false,
            date: date
       }
    end
end
