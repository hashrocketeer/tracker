class TraineeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :badge_id, :employee_number,
             :phone, :department_name, :category_name, :job_title_name
end
