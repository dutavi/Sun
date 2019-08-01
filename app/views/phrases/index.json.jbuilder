# frozen_string_literal: true

json.array! @phrases, partial: "phrases/phrase", as: :phrase
