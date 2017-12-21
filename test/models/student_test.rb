require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test "shouldn't allow save users without dni" do
    student = Student.new

    assert_not student.save
  end

  test "should allow save users without name" do
    student = Student.new

    assert_not student.save
  end

  test "should allow save users without last name" do
    student = Student.new

    assert_not student.save
  end

  test "should allow save users without number" do
    student = Student.new

    assert_not student.save
  end

  test "should allow save users without email" do
    student = Student.new

    assert_not student.save
  end

  test "shouldn't allow save users with an invalid email" do
    student = Student.new(dni: 'asdas', email: 'asda', number: 'asdasd',
                          name: 'asdasd', last_name: 'asdasd')

    assert_not student.save
  end

  test "should allow save a valid user" do
    student = Student.new(dni: '123112312312',
                          email: 'example@email.com',
                          number: '12312312',
                          name: 'asdasd',
                          last_name: 'asdasd')

    assert student.save
  end

  test "shouldn't allow save users with an invalid dni" do
    student = Student.new(dni: 'asdas',
                          email: 'example@email.com',
                          number: 'asdasd',
                          name: 'asdasd',
                          last_name: 'asdasd')

    assert_not student.save
  end

  test "shouldn't allow save users with an invalid number" do
    student = Student.new(dni: 'asdas',
                          email: 'example@email.com',
                          number: 'asdasd',
                          name: 'asdasd',
                          last_name: 'asdasd')

    assert_not student.save
  end
end
