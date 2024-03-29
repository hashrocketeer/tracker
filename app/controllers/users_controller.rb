class UsersController < ApplicationController
  respond_to :html

  include AsUsersController

  def create
    if user.update_attributes(company_id: company.id)
      flash[:success] = "Successfully added #{user.first_name} #{user.last_name}"
      redirect_to users_path
    else
      flash.now.alert = "User with that email already exists"
      render :new
    end
  end

end
