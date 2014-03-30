module AsLogicalDelete
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(deleted: false) }

    before_validation(on: :create) { :activate }

    def activate
      self.deleted = false
    end

    def deactivate
      update_attribute(:deleted, true)
    end
  end
end
