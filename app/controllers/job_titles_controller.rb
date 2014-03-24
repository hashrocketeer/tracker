class JobTitlesController < ApplicationController
  expose(:company) { current_user.company }
  expose(:job_titles) { JobTitle.where(company_id: company.id) }
  expose(:job_title, attributes: :job_title_params)

  def create
    job_title.save ?
      flash[:success] = ["You successfully", success_action, job_title.job_title_name].join(" ") :
      flash[:alert] = "Job Title name can't be blank"

    redirect_to job_titles_path
  end
  alias update create

  private

  def job_title_params
    params.require(:job_title).permit!
  end
end
