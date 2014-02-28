class UsersController < ApplicationController
  respond_to :html

  expose(:company) do
    Company.find_or_create_by(company_params)
  end
  expose(:user, attributes: :user_params)

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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def company_params
    params.require(:user).permit(:company_name)
  end

end
