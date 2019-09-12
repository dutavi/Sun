# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    @phrases = @user.phrases
    @terms = @user.terms
    @likes = @user.likes
    @phrases = Phrase.paginate(page: params[:page], per_page: 10)
    @terms = Term.paginate(page: params[:page], per_page: 10)
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, notice: I18.t("pages.users.update.flash_if")
    else
      redirect_to users_path, alert: I18.t("pages.users.update.flash_else")
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, notice: I18.t("pages.users.destroy.flash")
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end
end
