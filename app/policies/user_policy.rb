class UserPolicy < ApplicationPolicy
  def show?
    @user.role == 'admin' || @record == @user
  end
end
