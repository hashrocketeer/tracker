Fabricator(:category) do
  transient :company_name
  category_name { "My Category" }
  company_id  { |attrs| company_id_for(attrs[:company_name])}
  deleted { false }
end
