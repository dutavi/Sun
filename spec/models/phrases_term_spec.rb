# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhrasesTerm, type: :model do
  it { should belong_to(:phrase) }
  it { should belong_to(:term) }

  it do
    phrase = create(:phrase)
    term_params = attributes_for(:term)
    expect {
      phrase.terms.create(term_params)
    }.to change { Term.count }.by(1)
  end

  it do
    term = create(:term)
    phrase_params = attributes_for(:phrase)
    expect {
      term.phrases.create(phrase_params)
    }.to change { Phrase.count }.by(1)
  end

  it do
    term = create(:term)
    phrase_params = attributes_for(:phrase)
    expect {
      term.phrases.create(phrase_params)
    }.to change { PhrasesTerm.count }.by(1)
  end
end
