# frozen_string_literal: true

class CreatePhrasesTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases_terms do |t|
      t.references :phrase, foreign_key: true
      t.references :term, foreign_key: true

      t.timestamps
    end
  end
end
