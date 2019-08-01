# frozen_string_literal: true
require "administrate/base_dashboard"

class TermDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    word: Field::String,
    meaning: Field::String,
    reading: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :word,
    :meaning,
    :reading
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :word,
    :meaning,
    :reading,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :word,
    :meaning,
    :reading,
  ].freeze
end
