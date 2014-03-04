class User < ActiveRecord::Base
  include Authem::User

  belongs_to :company

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  accepts_nested_attributes_for :company

  delegate :company_name, to: :company, allow_nil: true
end
