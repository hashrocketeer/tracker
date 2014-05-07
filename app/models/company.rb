class Company < ActiveRecord::Base
  has_many :users
  has_many :departments
  has_many :job_titles
  has_many :categories
  has_many :trainees, -> { where(deleted: false) }
end
