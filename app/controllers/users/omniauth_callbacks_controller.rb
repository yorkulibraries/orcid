class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def orcid
    Rails.logger.debug "auth info from omniauth: " + request.env["omniauth.auth"].to_yaml
          
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.token = request.env["omniauth.auth"].credentials.token
    @user.refresh_token = request.env["omniauth.auth"].credentials.refresh_token
    @user.token_expires_at = request.env["omniauth.auth"].credentials.expires_at
    @user.save
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    end     
  end
  
  def failure
    redirect_to root_path
  end

end
