# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
  Teacher.create(email: "teacher#{i}@email.com", password: "password")
end

9.times do |i|
  signature = SignatureYear.create(year: "201#{i}")
  3.times do |i|
    Test.create(title: "Parcial ##{i}", note_to_approve: 6.0, due_date: Date.today, signature_year: signature)
  end
  6.times do |i|
    student = Student.create(name: "Name ##{i}", last_name: "LastName ##{i}", email: "student#{i}@email.com", dni: "1234#{i}", number: "1023#{i}", signature_year: signature)
    signature.tests.each do |test|
      TestNote.create(note: 7, test: test, student: student)
    end
  end
end