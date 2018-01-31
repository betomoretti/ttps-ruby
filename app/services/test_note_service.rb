class TestNoteService
  def initialize(test_notes)
    @test_notes = test_notes
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