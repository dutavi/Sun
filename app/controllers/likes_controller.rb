# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_term
  before_action :find_like, only: [:destroy]


  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @term.likes.create(user_id: current_user.id)
    end
    redirect_to term_path(@term)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to term_path(@term)
  end

  private

  def find_term
    @term = Term.find(params[:term_id])
  end

  def find_like
    @like = @term.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, term_id:
    params[:term_id]).exists?
  end
end
