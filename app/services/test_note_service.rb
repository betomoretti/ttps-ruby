class TestNoteService
  def initialize(test_notes)
    @test_notes = test_notes
  end

  def self.create_test_notes(students, test)
    students.map { |s| create(s, test) }
  end

  def totals
    {
      approved: approved_cant,
      disapproved: disapproved_cant,
      ausent: ausent_cant,
      approved_average: (Float(approved_cant) / Float(@test_notes.count)) * 100
    }
  end

  private

  def self.create(student, test)
    TestNote.find_or_create_by(student: student, test: test) do |tn|
      tn.student = student
      tn.test = test
    end
  end

  def approved_cant
    @test_notes.where('note >= note_to_approve').count
  end

  def disapproved_cant
    @test_notes.where('note < note_to_approve').count
  end

  def ausent_cant
    @test_notes.where(note: nil).count
  end
end