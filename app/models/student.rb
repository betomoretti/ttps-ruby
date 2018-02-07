class Student < ApplicationRecord
  belongs_to :signature_year
  has_many :test_notes, dependent: :destroy

  validates :dni, :email, :number, :name, :last_name, presence: true
  validates_with EmailValidator
  validates :dni, :number, format: { with: /\d/, message: :format }
end
