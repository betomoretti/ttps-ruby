class TestNoteService
  def initialize(test_notes, students, signature_year)
    @test_notes = test_notes
    @students = students
    @signature_year = signature_year
  end

  def self.create_test_notes(students, test)
    students.map { |s| create(s, test) }
  end

  def totals
    @signature_year.tests.map do |t|
      {
        name: t.title,
        total_approved: approved_cant(t),
        total_disapproved: disapproved_cant(t),
        total_ausent: ausent_cant(t),
        approved_average: approved_average(t)
      }
    end
  end

  private

  def self.create(student, test)
    TestNote.find_or_create_by(student: student, test: test) do |tn|
      tn.student = student
      tn.test = test
    end
  end

  def approved_average(test)
    (Float(approved_cant(test)) / Float(test.test_notes.count)) * 100
  end

  def approved_cant(test)
    test.test_notes.where('note >= ?', test.note_to_approve).count
  end

  def disapproved_cant(test)
    test.test_notes.where('note < ?', test.note_to_approve).count
  end

  def ausent_cant(test)
    test.test_notes.where(note: nil).count
  end
end