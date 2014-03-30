class Category < ActiveRecord::Base
  belongs_to :company

  scope :active_categories, -> { where(deleted: false) }

  before_validation(on: :create) { :activate }

  validates_presence_of :category_name

  def activate
    self.deleted = false
  end

  def deactivate
    update_attribute(:deleted, true)
  end
end
