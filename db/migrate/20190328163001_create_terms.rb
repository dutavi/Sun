# frozen_string_literal: true

class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :word, null: false
      t.string :meaning
      t.string :reading

      t.timestamps

      t.index :word
    end
  end
end
