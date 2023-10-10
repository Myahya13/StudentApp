class CreateStudentExams < ActiveRecord::Migration[6.1]
  def change
    create_table :student_exams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.boolean :completed, default: false
      t.integer :score
      t.timestamps
    end
  end
end
