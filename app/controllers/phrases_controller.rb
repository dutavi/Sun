# frozen_string_literal: true

class PhrasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  def index
    @phrases = Phrase.all
    @phrases = Phrase.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comment = Comment.new
    @comments = @phrase.comments.order("created_at DESC")
  end

  def new
    @phrase = Phrase.new
  end

  def edit
    authorize @phrase
  end

  def create
    @phrase = Phrase.new(phrase_params)
    @phrase.user_id = current_user.id

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: I18n.t("pages.phrases.create.success") }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render "new" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @phrase
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to @phrase, notice: I18n.t("pages.phrases.update.success") }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render "edit" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @phrase
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url, notice: I18n.t("pages.phrases.destroy.success") }
      format.json { head :no_content }
    end
  end

  private

  def set_phrase
    @phrase = Phrase.find(params[:id])
  end

  def phrase_params
    params.require(:phrase).permit(:sentence)
  end
end
