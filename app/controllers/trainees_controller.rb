class TraineesController < ApplicationController
  include AsCompanyMetaDataController

  expose(:trainee, attributes: :trainee_params)

  def create
    trainee.save ?
      flash[:success] = ["You successfully", success_action, trainee.first_name, trainee.last_name].join(" ") :
      flash[:alert] = "Trainee name can't be blank"
    redirect_to trainees_path
  end

  private

  def trainee_params
    params[:trainee].merge! company_id: company.id
    params.require(:trainee).permit!
  end
end
