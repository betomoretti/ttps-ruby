class SignatureYear < ApplicationRecord
  has_many :students
  has_many :tests
  has_many :test_notes, through: :tests
end
