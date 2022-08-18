class WelcomeController < ApplicationController
  def index
    
  end
  
  def authorize
      redirect_to helpers.orcid_authorize_url
  end
end
