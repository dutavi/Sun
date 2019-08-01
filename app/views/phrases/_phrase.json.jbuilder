# frozen_string_literal: true

json.extract! phrase, :id, :sentence, :created_at, :updated_at
json.url phrase_url(phrase, format: :json)
