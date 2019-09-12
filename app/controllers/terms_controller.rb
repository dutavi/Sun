# frozen_string_literal: true

class TermsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  # GET /terms
  # GET /terms.json
  def index
    if params[:query].present?
    @terms = Term.where("`title` LIKE '%#{params[:query]}%'")
    elsif params[:tag].present?
    @terms = Term.tagged_with([params[:tag]])
    else
    @terms = Term.all
    end
    @terms = Term.paginate(page: params[:page], per_page: 10)
  end

  # GET /terms/1
  # GET /terms/1.json
  def show
  end

  # GET /terms/new
  def new
    @term = Term.new
  end

  # GET /terms/1/edit
  def edit
    authorize @term
  end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(term_params)
    @term.user_id = current_user.id

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: I18n.t("pages.terms.create.success") }
        format.json { render :show, status: :created, location: @term }
      else
        format.html render "new"
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    authorize @term
    respond_to do |format|
      if @term.update(term_params)
        format.html { redirect_to @term, notice: I18n.t("pages.terms.update.success") }
        format.json { render :show, status: :ok, location: @term }
      else
        format.html render "edit"
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    authorize @term
    @term.destroy
    respond_to do |format|
      format.html { redirect_to terms_url, notice: I18n.t("pages.terms.destroy.success") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_term
    @term = Term.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def term_params
    params.require(:term).permit(:word, :meaning, :reading)
  end
end
