# frozen_string_literal: true

FactoryBot.define do
  factory :term do
    word { "The Word" }
    meaning { "The Meaning" }
    reading { "The Reading" }
  end
end
