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


  building = Building.create!(title: 'Far far far away', code: 'FFA')
  print '.'
  building.save!
  puts
end
unless Student.any?
  first_names = ['John', 'Tom', 'Jack', 'Rob']
  last_names = ['Doe', 'Bell', 'Smith', 'Black']
  first_names.each_with_index do |first_name, i|
    student = Student.create!(first_name: first_name, last_name: last_names[i])
    print '.'
    student.save!
  end

end
unless Teacher.any?
  first_names = ['Jack', 'Hannah', 'George', 'Max']
  last_names = ['Martell', 'Smith', 'White', 'Stone']
  first_names.each_with_index do |first_name, i|
    teacher = Teacher.create!(first_name: first_name, last_name: last_names[i])
    print '.'
    teacher.save!
  end
end
unless Course.any?
  codes = ['PR1', 'WEB', 'MAE', 'ORA']
  titles = ['Programming', 'Web Technologies', 'Macroeconomy', 'Oracle Databases']
  lessons = {'PR1' => [{:start_at => "30/12/2018 16:29:30", :end_at => "30/12/2018 18:29:30"}, {:start_at => "31/12/2018 9:20:00", :end_at => "31/12/2018 12:00:00"}], 'WEB' => [{:start_at => "29/12/2018 10:00:00", :end_at => "29/12/2018 12:30:00"}, {:start_at => "30/12/2018 13:40:00", :end_at => "30/12/2018 16:00:00"}]}
  codes.each_with_index do |code, i|
    course = Course.create!(code: code, title: titles[i])
    print '.'
    if lessons.has_key? code

      lessons_arr = []
      lessons[code].each do |lesson|
        l = Lesson.create!(start_at: lesson[:start_at], end_at: lesson[:end_at], teacher_id: Teacher.first.id, room_id: Room.first.id, course: course)
        print '.'
        l.save!
        lessons_arr << l
      end
      course.lessons = lessons_arr
      t = TeacherAssignment.create!(teacher_id: Teacher.first.id, course: course)
      t.save!
    end
    course.save!
  end
end