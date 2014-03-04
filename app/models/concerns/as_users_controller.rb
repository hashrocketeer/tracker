module AsUsersController
  extend ActiveSupport::Concern

  included do
    expose(:company) { Company.find_or_create_by(company_params) }
    expose(:users) { User.where(company_id: company_id) }
    expose(:user, attributes: :user_params)

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def company_params
      params.require(:user).permit(:company_name)
    end

    def company_id
      (current_user || NilUser).company_id
    end
  end

end
