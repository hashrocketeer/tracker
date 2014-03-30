class Department < ActiveRecord::Base
  include AsLogicalDelete

  belongs_to :company

  validates_presence_of :department_name
end
