# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_term
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = I18n.t"pages.likes.create.flash"
    else
      @term.likes.create(user_id: current_user.id)
    end
    redirect_to term_path(@term)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = I18n.t"pages.likes.destroy.flash"
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
    user_id =  current_user.id
    term_id = params[:term_id]
    Like.publics(user_id, term_id).exists?
  end
end
