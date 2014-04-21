Fabricator(:category) do
  transient :company_name
  company_id  { |attrs| company_id_for(attrs[:company_name])}

  deleted { false }
end
