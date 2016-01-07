class SessionsController < Devise::SessionsController
  def create
    super
  end

  def destroy
    current_user.update_attributes(status:false)
    super
  end
  # protected
  #
  # def after_sign_in_path_for(resource)
  #   if resource.is_a?(User) && resource.banned?
  #     sign_out resource
  #     flash[:error] = "This account has been suspended for violation of...."
  #     unauthenticated_root_path
  #   else
  #     super
  #   end
  #  end

end
