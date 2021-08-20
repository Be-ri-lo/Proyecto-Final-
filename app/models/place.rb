class Place < ApplicationRecord
    #searchkick word_start: [:location]

    has_many :trainings

    scope :active, ->{ where(active: true) }
    
    geocoded_by :location
    after_validation :geocode, if: :location_changed?

    def to_s
        self.location    
    end

    def search_data
       {
            country: country,
            city: city,
            location: location, null: false          
       }
    end
end
