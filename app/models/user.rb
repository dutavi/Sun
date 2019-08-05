# frozen_string_literal: true

class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :phrases, dependent: :destroy
  has_many :terms, dependent: :destroy

  def username
    return email.split("@")[0].capitalize
  end
end