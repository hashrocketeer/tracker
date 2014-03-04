class CategoriesController < ApplicationController
  expose(:company) { current_user.company }
  expose(:categories) { Category.where(company_id: company.id) }
end
