class AddTestRefToTestNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_notes, :test, foreign_key: true
  end
end
