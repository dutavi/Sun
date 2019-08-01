# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_phrase
  before_action :authenticate_user!

  def create
    @comment = @phrase.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = @phrase.comments.find(params[:id])
    @comment_id = @comment.id
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :phrase_id)
  end

  def set_phrase
    @phrase = Phrase.find(params[:phrase_id])
  end
end
