Fabricator(:department) do
  transient :company_name
  department_name { "My Department" }
  company_id  { |attrs| Company.find_or_create_by(company_name: attrs[:company_name]).id }
  deleted { false }
end
