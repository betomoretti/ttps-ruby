class AddSignatureYearRefToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :signature_year, foreign_key: true
  end
end
