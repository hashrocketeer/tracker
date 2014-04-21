class Api::V1::TraineesController < ApplicationController
  respond_to :json

  expose(:company) { current_company }
  expose(:trainees) { company.trainees.where(search_params) }

  def search
    render json: trainees, root: false
  end

  private

  def clean_params
    params[:trainee].reject! { | key, val | val == "" }
  end

  def search_params
    clean_params
    params.require(:trainee).permit(:first_name, :last_name, :badge_id, :employee_number,
                                    :phone, :department_id, :category_id, :job_title_id)
  end

end
