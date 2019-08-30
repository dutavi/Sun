# frozen_string_literal: true

class Term < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :phrases
  validates :word, :meaning, :reading, presence: true
  validates :word , length: { maximum: 255 }
  validates :meaning, length: { maximum: 255}
  validates :reading, length: { maximum: 255 }
  has_many :phrases_terms
  has_many :likes, dependent: :destroy
  scope :recent, -> { order ("created_at DESC") }
end
