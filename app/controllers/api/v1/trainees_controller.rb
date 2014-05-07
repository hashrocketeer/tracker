class Api::V1::TraineesController < ApplicationController
  respond_to :json

  expose(:company) { current_company }
  expose(:trainees) { company.trainees.where(trainee_params) }
  expose(:trainee, attributes: :trainee_params)

  def search
    render json: trainees, root: false
  end

  def create
    trainee.save
    render json: trainee, root: false
  end

  def update
    trainee = updateable_trainee.update_attributes(trainee_params)
    render json: trainee, root: false
  end

  def destroy
    updateable_trainee.deactivate
    render json: "ok".to_json, root: false
  end

  private

  def updateable_trainee
    Trainee.find_by(id: params[:id])
  end

  def clean_params
    params[:trainee].reject! { | key, val | val == "" }
  end

  def trainee_params
    clean_params
    params.require(:trainee).permit(:first_name, :last_name, :badge_id, :employee_number,
                                    :phone, :department_id, :category_id, :job_title_id)
  end

end
