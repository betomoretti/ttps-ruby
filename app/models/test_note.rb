class TestNote < ApplicationRecord
  belongs_to :student
  belongs_to :test
  validates :note, :test, :student, presence: true

  def approved?
    return 'ausent' unless note.present?
    note >= test.note_to_approve ? 'yes' : 'no'
  end
end
