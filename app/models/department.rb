class Department < ActiveRecord::Base
  belongs_to :company

  validates_presence_of :department_name
end
