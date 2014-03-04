class Company < ActiveRecord::Base
  has_many :user
  has_many :department
end
