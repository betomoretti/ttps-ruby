class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :due_date

      t.timestamps
    end
  end
end
