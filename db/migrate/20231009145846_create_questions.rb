# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.boolean :correct, default: nil
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
