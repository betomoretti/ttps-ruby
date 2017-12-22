class Student < ApplicationRecord
  belongs_to :signature_year

  validates :dni, :email, :number, :name, :last_name, presence: true
  validates_with EmailValidator
  validates :dni, :number, format: { with: /\d/,
                                    message: "only allows letters" }
end
