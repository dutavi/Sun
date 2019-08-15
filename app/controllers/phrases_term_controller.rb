# frozen_string_literal: true

class PhrasesTermController < ApplicationController
  before_action :authenticate_user!
  before_action :set_term

  def create
    @phrases_term = @term.phrases_terms.new(phrases_term_params)
    @phrases_term.user = current_user
    @phrases_term.save
    redirect_back(fallback_location: root_path)
  end

  private

  def phrases_term_params
    params.require(:phrases_term).permit(:term_id, :phrase_id)
  end

  def set_term
    @term = Term.find(params[:term_id])
  end
end
