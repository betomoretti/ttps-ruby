class Test < ApplicationRecord
  belongs_to :signature_year
  has_many :test_notes
end
