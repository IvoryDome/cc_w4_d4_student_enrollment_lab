require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all
House.delete_all

house1 = House.new({
  "name" => "Earth"
  })

house2 = House.new({
  "name" => "Water"
  })

house3 = House.new({
  "name" => "Air"
  })

house4 = House.new({
  "name" => "Fire"
  })

  house1.save
  house2.save
  house3.save
  house4.save


student1 = Student.new({
  "first_name" => "Rocky",
  "second_name" => "Paperfella",
  "house_id" => house1.id,
  "age" => 15
  })

student2 = Student.new({
  "first_name" => "Gollum",
  "second_name" => "Smeagol",
  "house_id" => house2.id,
  "age" => 14
  })

  student3 = Student.new({
  "first_name" => "Patrick",
  "second_name" => "Peterson",
  "house_id" => house1.id,
  "age" => 16
  })



  student1.save
  student2.save
  student3.save
