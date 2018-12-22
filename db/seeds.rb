# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Building.any?
  building = Building.create!(title: 'Parukářka', code: 'PAR')
  print '.'

  rooms = []
  titles = ['Kanárek', 'Albrecht', 'Alfons']
  ['PAR 0.1', 'PAR 1.1', 'PAR 1.2'].each_with_index do |room_code, i|
    room = Room.create!(building: building, code: room_code, title: titles[i])

    room.save!
    rooms << room
    print '.'
  end
  building.rooms = rooms;
  building.save!


  building = Building.create!(title: 'Classic', code: 'CL7')
  print '.'
  rooms = []
  titles = ['Londýn', 'New York', 'Peking']
  ['CL7 0.1', 'CL7 1.1', 'CL7 1.2'].each_with_index do |room_code, i|
    room = Room.create!(building: building, code: room_code, title: titles[i])

    room.save!
    rooms << room
    print '.'
  end
  building.rooms = rooms;
  building.save!

  puts
end