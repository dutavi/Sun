# frozen_string_literal: true

class Phrase < ApplicationRecord
  has_and_belongs_to_many :terms
  validates :sentence, presence: true
  has_many :comments, dependent: :destroy
end
