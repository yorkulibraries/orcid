class UsersController < ApplicationController 
  
  def show
    @user = User.find(params[:id])
    @orcid = @user.get_orcid_record
  end
    
end
