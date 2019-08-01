# frozen_string_literal: true

require "administrate/base_dashboard"

class PhraseDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
   id: Field::Number,
   sentence: Field::Text,
   created_at: Field::DateTime,
   updated_at: Field::DateTime,
 }.freeze

  COLLECTION_ATTRIBUTES = [
   :id,
   :sentence,
 ].freeze

  SHOW_PAGE_ATTRIBUTES = [
   :id,
   :sentence,
   :created_at,
   :updated_at,
 ].freeze

  FORM_ATTRIBUTES = [
   :sentence,
 ].freeze
end
