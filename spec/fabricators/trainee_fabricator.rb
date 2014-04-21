Fabricator(:trainee) do
  transient company_name: Faker::Company.name
  transient category: Faker::HipsterIpsum.word
  transient department: Faker::Company.bs
  transient job_title: Faker::Job.title

  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }

  phone { Faker::PhoneNumber.short_phone_number }

  company_id  { |attrs| company_id_for(attrs[:company_name])}
  category_id  { |attrs| category_id_for(attrs[:category], attrs[:company_id])}
  job_title_id  { |attrs| job_title_id_for(attrs[:job_title], attrs[:company_id])}
  department_id  { |attrs| department_id_for(attrs[:department], attrs[:company_id])}

  deleted { false }
end
