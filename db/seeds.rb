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

    #room.questions << Question.new(room: room, title: "Co je to #{room_code}?", score: 5, hint: 'napište význam zkratky i k čemu se to používá')
    #room.questions << Question.new(room: room, title: "K čemu slouží #{room_code}? K čemu se naopak používat nemá?", score: 5, hint: 'napište k čemu se to používá a k čemu se to používat nemá')

    room.save!
    rooms << room
    print '.'
  end
  building.rooms = rooms;
  building.save!
  puts
end