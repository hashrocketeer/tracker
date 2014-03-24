class DepartmentsController < ApplicationController
  expose(:company) { current_user.company }
  expose(:departments) { Department.where(company_id: company.id) }
  expose(:department, attributes: :department_params)

  def create
    department.save ?
      flash[:success] = ["You successfully", success_action, department.department_name].join(" ") :
      flash[:alert] = "Department name can't be blank"
    redirect_to departments_path
  end
  alias update create

  private

  def department_params
    params.require(:department).permit!
  end
end
