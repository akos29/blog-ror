class ApplicationController < ActionController::Base
  def current_user
    # User.order(:created_at).first
    User.find(params[:user_id])
  end

  helper_method :current_user
end
