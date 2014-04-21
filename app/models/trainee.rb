class Trainee < ActiveRecord::Base
  include AsLogicalDelete

  belongs_to :company
  belongs_to :department
  belongs_to :category
  belongs_to :job_title

  validates_presence_of :first_name, :last_name

  delegate :department_name, to: :department, allow_nil: true
  delegate :category_name, to: :category, allow_nil: true
  delegate :job_title_name, to: :job_title, allow_nil: true
end
