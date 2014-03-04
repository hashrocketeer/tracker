
class RegistersController < ApplicationController
  respond_to :html

  include AsUsersController

  def create
    if user.update_attributes(company_id: company.id)
      flash[:success] = "Thank you for registering"
      sign_in(user)
      respond_with current_user, location: root_url
    else
      flash.now.alert = "User with that email already exists"
      render :new
    end
  end
end
