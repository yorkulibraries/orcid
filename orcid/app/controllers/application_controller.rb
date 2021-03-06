class ApplicationController < ActionController::Base
  include Pundit
  
  before_action :generate_omniauth_state
  
  def generate_omniauth_state
    session['omniauth.state'] = SecureRandom.uuid
  end
  
  def after_sign_in_path_for(resource)
    helpers.thank_you_page || request.env['omniauth.origin'] || user_path(resource.id)
  end
  
end
