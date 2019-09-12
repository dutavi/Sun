# frozen_string_literal: true

class PhrasesTermsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_term

  def index
    @phrases_terms = @term.phrases_terms
  end

  def new
    @phrases_term = PhrasesTerm.new
  end

  def create
    @phrases_term = @term.phrases_terms.new(phrases_term_params)
    if @phrases_term.save
      redirect_to term_phrases_terms_path(@term, @phrases_term), notice: "Phrases_Term was successfully created"
    else
      render "new"
    end
  end

  private

  def phrases_term_params
    params.require(:phrases_term).permit(:term_id, :phrase_id)
  end

  def set_term
    @term = Term.find(params[:term_id])
  end
end
