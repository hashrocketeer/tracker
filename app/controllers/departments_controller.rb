class DepartmentsController < ApplicationController
  expose(:company) { current_user.company }
  expose(:departments) { Department.where(company_id: company.id) }
end
