class ApplicationController < ActionController::Base
  def current_user
    User.order(:created_at).first
  end

  helper_method :current_user
end
