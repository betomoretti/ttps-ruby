class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :dni
      t.string :number
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
