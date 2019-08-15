# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :term
  belongs_to :user
end
