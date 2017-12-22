class AddStudentRefToTestNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_notes, :student, foreign_key: true
  end
end
