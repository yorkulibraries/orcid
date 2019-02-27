class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def orcid
    Rails.logger.debug "auth info from omniauth: " + request.env["omniauth.auth"].to_yaml
          
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    end     
  end
  
  def failure
    redirect_to root_path
  end

end
