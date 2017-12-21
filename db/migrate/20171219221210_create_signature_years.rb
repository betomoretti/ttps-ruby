class CreateSignatureYears < ActiveRecord::Migration[5.1]
  def change
    create_table :signature_years do |t|
      t.string :year

      t.timestamps
    end
  end
end
