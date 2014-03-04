class JobTitlesController < ApplicationController
  expose(:company) { current_user.company }
  expose(:job_titles) { JobTitle.where(company_id: company.id) }
end
