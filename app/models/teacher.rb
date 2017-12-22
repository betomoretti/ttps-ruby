class Teacher < ApplicationRecord
  validates :email, presence: true
  validates_with EmailValidator
end
