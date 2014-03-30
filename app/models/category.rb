class Category < ActiveRecord::Base
  include AsLogicalDelete

  belongs_to :company

  validates_presence_of :category_name
end
