class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #load_and_authorize_resource
  #before_action :last_seen_at, if: proc { user_signed_in?}
  before_filter :banned?

  private
  def banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      redirect_to unauthenticated_root_path
      flash[:alert]="Your account is blocked peases contact system admin"
    end
  end

  def check_for_blocking
    if user.banned == true
      sign_out current_user
      redirect_to "unauthenticated_root", notice: "your account hasbeen blocked please contact adminstrater"
    end
  end
end
