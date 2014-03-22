class CategoriesController < ApplicationController
  expose(:company) { current_user.company }
  expose(:categories) { Category.where(company_id: company.id) }
  expose(:category, attributes: :category_params)

  def create
    category.save
    flash[:success] = "You successfully added #{category.category_name}"
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit!
  end

end
