def company_id_for(company_name)
  Company.find_or_create_by(company_name: company_name).id
end

def category_id_for(category_name, company_id)
  Category.find_or_create_by(category_name: category_name, company_id: company_id).id
end

def department_id_for(department_name, company_id)
  Department.find_or_create_by(department_name: department_name, company_id: company_id).id
end

def job_title_id_for(job_title, company_id)
  JobTitle.find_or_create_by(job_title_name: job_title, company_id: company_id).id
end
