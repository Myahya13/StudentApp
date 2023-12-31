# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
