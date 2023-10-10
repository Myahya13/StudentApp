class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :title
      t.text     :description
      t.integer   :marks
      t.datetime   :show_exam
      t.boolean   :status , default: false
      t.references  :subject  , null:  false , foreign_key:  true
      t.references   :user  , null:   false , foreign_key:    true

      t.timestamps
    end
  end
end
