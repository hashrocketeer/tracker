class UsersController < ApplicationController

  expose(:company) do
    Company.find_or_create_by(company_params)
  end
  expose(:user, attributes: :user_params)

  def create
    if user.update_attributes(company_id: company.id)
      redirect_to root_path, notice: "Thank you for registering"
    else
      flash[:error] = "User with that email already exists"
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
