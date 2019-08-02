# frozen_string_literal: true

class AddUserIdToPhrase < ActiveRecord::Migration[6.0]
  def change
    add_column :phrases, :user_id, :integer, index: true
  end
end
