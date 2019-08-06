# frozen_string_literal: true

class AddUserIdToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :user_id, :integer, index: true
  end
end
