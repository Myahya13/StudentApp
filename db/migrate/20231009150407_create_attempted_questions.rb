# frozen_string_literal: true

class CreateAttemptedQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :attempted_questions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
