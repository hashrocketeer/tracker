Fabricator(:user) do
  transient :company_name
  company_id  { |attrs| Company.find_or_create_by(company_name: attrs[:company_name]).id }
  password { "password" }
  password_confirmation { "password" }
end
