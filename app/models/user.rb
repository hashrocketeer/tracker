class User < ActiveRecord::Base
  include Authem::User

  has_one :company

  validates_uniqueness_of :email

  accepts_nested_attributes_for :company

  delegate :company_name, to: :company, allow_nil: true
end
