# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

9.times do |i|
  SignatureYear.create(year: "201#{i}")
end

5.times do |i|
  Test.create(title: "Parcial ##{1}", due_date: Date.today, signature_year_id: SignatureYear.first.id)
end

5.times do |i|
  Student.create(name: "Name ##{i}", last_name: "LastName ##{i}", email: "student#{i}@email.com", dni: "1234#{i}", number: "1023#{i}", signature_year_id: SignatureYear.first.id)
end

5.times do |i|
  id = 1
  TestNote.create(note: 7, test_id: id, student_id: Student.first.id)
  id += 1
end
