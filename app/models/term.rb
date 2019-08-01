# frozen_string_literal: true

class Term < ApplicationRecord
  has_and_belongs_to_many :phrases
  validates :word, :meaning, :reading, presence: true
  validates :word , length: { maximum: 255 }
  validates :meaning, length: { maximum: 255}
  validates :reading, length: { maximum: 255 }
end
