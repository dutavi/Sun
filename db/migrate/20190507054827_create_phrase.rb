# frozen_string_literal: true

class CreatePhrase < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.text :sentence, null: false

      t.timestamps
    end
  end
end
