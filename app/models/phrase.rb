# frozen_string_literal: true

class Phrase < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :terms
  validates :sentence, presence: true
  has_many :comments, dependent: :destroy
  scope :recent, -> {order("created_at DESC")}
end