# frozen_string_literal: true

require "rails_helper"

RSpec.describe PhrasesTerm, type: :model do
  it { should belong_to(:phrase) }
  it { should belong_to(:term) }

  it do
    user = create(:user)
    phrase = create(:phrase, user_id: user.id)
    term_params = attributes_for(:term)
    expect {
      phrase.terms.create(term_params)
    }.to change { Term.count }.by(1)
  end

  it do
    user = create(:user)
    term = create(:term)
    phrase_params = attributes_for(:phrase, user_id: user.id)
    expect {
      term.phrases.create(phrase_params)
    }.to change { Phrase.count }.by(1)
  end

  it do
    user = create(:user)
    term = create(:term)
    phrase_params = attributes_for(:phrase, user_id: user.id)
    expect {
      term.phrases.create(phrase_params)
    }.to change { PhrasesTerm.count }.by(1)
  end
end
