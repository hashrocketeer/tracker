Fabricator(:job_title) do
  transient :company_name
  company_id  { |attrs| Company.find_or_create_by(company_name: attrs[:company_name]).id }
  deleted { false }
end
