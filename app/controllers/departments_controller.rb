class DepartmentsController < ApplicationController
  expose(:company) { current_user.company }
  expose(:departments) { Department.where(company_id: company.id) }
  expose(:department, attributes: :department_params)

  def create
    department.save
      flash[:success] = "You successfully added #{department.department_name}"
    redirect_to departments_path
  end

  private

  def department_params
    params.require(:department).permit!
  end
end
