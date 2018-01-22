class Test < ApplicationRecord
  belongs_to :signature_year, required: true
  has_many :test_notes, dependent: :destroy
  validates :note_to_approve, presence: true
end
