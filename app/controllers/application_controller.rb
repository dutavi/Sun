# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit
  protect_from_forgery

  private

 def user_not_authorized(exception)
   policy_email = exception.policy.class.to_s.underscore

   flash[:error] = t "#{policy_email}.#{exception.query}", scope: "pundit", default: :default
   redirect_to(request.referrer || root_path)
 end
end
