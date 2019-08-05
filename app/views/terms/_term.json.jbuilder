# frozen_string_literal: true

json.extract! term, :id, :word, :meaning, :reading, :created_at, :updated_at
json.url term_url(term, format: :json)
