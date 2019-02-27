class ApplicationController < ActionController::Base
  before_action :generate_omniauth_state
  
  def generate_omniauth_state
    session['omniauth.state'] = SecureRandom.uuid
  end
  
end
