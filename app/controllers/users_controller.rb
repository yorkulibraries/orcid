class UsersController < ApplicationController 
  before_action :authenticate_user!
  after_action :verify_authorized
  
  def show
    @user = authorize User.find(params[:id])
    @orcid = @user.get_orcid_record
  end
    
end
