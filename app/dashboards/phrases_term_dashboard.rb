# frozen_string_literal: true
require "administrate/base_dashboard"

class PhrasesTermDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    phrase_id: Field::Number,
    term_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :phrase_id,
    :term_id,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :phrase_id,
    :term_id,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :phrase_id,
    :term_id
  ].freeze
end
