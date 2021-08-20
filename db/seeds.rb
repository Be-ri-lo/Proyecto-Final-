# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



places = [
    { country: 'Chile', city: 'Santiago', location: 'Parque Panul'},
    { country: 'Chile', city: 'Valparaiso', location: 'Jardín Botánico'},
    { country: 'Chile', city: 'Santiago', location: 'Parque Bicentenario'},
    { country: 'Chile', city: 'Santiago', location: 'Ñuñoa'},
    { country: 'Chile', city: 'Puerto Natales', location: 'Torres del Paine'},
    { country: 'Chile', city: 'Santiago', location: 'Parque Panul'},
    { country: 'Chile', city: 'Iquique', location: 'Playa Cabancha'},
    { country: 'Chile', city: 'Santiago', location: 'Cerro San Cristobal'},
    { country: 'Chile', city: 'Santiago', location: 'Cualquier lugar'}
]

places_arr = places.map do |place|
    place = Place.create!(country: place[:country], 
                          city: place[:city], 
                          location: place[:location])
    puts "Se ha creado el lugar: #{place.location}"

    place
end

5.times do
    user = User.create!(name: Faker::Name.name,
                        email: Faker::Internet.email(domain: 'example'),
                        password: 123456)

    puts "Se ha creado el usuario: #{user.email} y su clave es: 123456"    

    10.times do
        training = user.trainings.create!(
            name: Faker::Team.sport, 
            sport: Training.sports.keys.sample, 
            level: Training.levels.keys.sample,
            date: Faker::Time.between(from: DateTime.now - ((1..10).to_a.sample).minute, to: DateTime.now, format: :short), 
            place: places_arr.sample
        )

        puts "Creando entrenos: #{training.name}"
    end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?