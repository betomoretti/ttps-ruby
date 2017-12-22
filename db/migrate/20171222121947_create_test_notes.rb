class CreateTestNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :test_notes do |t|
      t.float :note

      t.timestamps
    end
  end
end
