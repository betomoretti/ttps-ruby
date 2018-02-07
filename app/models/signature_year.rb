class SignatureYear < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :test_notes, through: :tests

  validates :year, uniqueness: true, presence: true
end
