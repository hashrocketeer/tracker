class CategoriesController < ApplicationController
  expose(:company) { current_user.company }
  expose(:categories) { Category.active_categories.where(company_id: company.id) }
  expose(:category, attributes: :category_params)

  def create
    category.save ?
      flash[:success] = ["You successfully", success_action, category.category_name].join(" ") :
      flash[:alert] = "Category name can't be blank"

    redirect_to categories_path
  end
  alias update create

  def destroy
    category.deactivate
    flash[:success] = "You successfully deleted #{category.category_name}"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit!
  end

end
