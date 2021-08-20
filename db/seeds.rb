# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


places = [
    { country: 'Chile', city: 'Santiago', location: 'Parque Panul', latitude: '-33.3152', longitude: '-70.3156'},
    { country: 'Chile', city: 'Valparaiso', location: 'Jardín Botánico', latitude: '-33.044999', longitude: '-71.501944'},
    { country: 'Chile', city: 'Santiago', location: 'Parque Bicentenario', latitude: '-33.40057595', longitude: '-70.6024464766479'},
    { country: 'Chile', city: 'Santiago', location: 'Ñuñoa', latitude: '-33.4547302', longitude: '-70.5936269495485'},
    { country: 'Chile', city: 'Puerto Natales', location: 'Torres del Paine', latitude: '-50.9423262', longitude: '-73.4067879'},
    { country: 'Chile', city: 'Santiago', location: 'Parque O´higgins', latitude: '-33.4642907', longitude: '-70.6603899388084'},
    { country: 'Chile', city: 'Iquique', location: 'Playa Cabancha', latitude: '-20.2307033', longitude: '-70.1356692'},
    { country: 'Chile', city: 'Santiago', location: 'Cerro San Cristobal', latitude: '-33.4202404', longitude: '-70.6313749'},
    { country: 'Chile', city: 'Pichilemu', location: 'Punta de Lobos', latitude: '-34.4292749', longitude: '-72.0375683'}
]

places_arr = places.map do |place|
    place = Place.create!(country: place[:country], 
                          city: place[:city], 
                          location: place[:location],
                          latitude: place[:latitude],
                          longitude: place[:longitude])
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
            #image: images_names.sample
            name: Faker::Team.sport, 
            sport: Training.sports.keys.sample, 
            level: Training.levels.keys.sample,
            date: Faker::Time.between(from: DateTime.now - ((1..10).to_a.sample).minute, to: DateTime.now, format: :short), 
            place: places_arr.sample
        )

        puts "Creando entrenos: #{training.name}"
    end
end
