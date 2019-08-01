# frozen_string_literal: true

class PhrasesTerm < ApplicationRecord
  belongs_to :phrase
  belongs_to :term
end
