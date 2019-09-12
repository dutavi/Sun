# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :term
  belongs_to :user
  scope :publics, -> (user_id, term_id) { where(user_id: user_id, term_id: term_id) }
end
