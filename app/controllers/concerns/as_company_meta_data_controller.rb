module AsCompanyMetaDataController
  extend ActiveSupport::Concern

  included do
    expose(:company) { current_company }
    expose(:departments) { departments_for(company) }
    expose(:categories) { categories_for(company) }
    expose(:job_titles) { job_titles_for(company) }

    private

    def map_collection_for(collection, name)
      collection.map do |d|
        [d.send(name), d.id]
      end
    end

    def departments_for(company)
      map_collection_for(company.departments.active, :department_name)
    end

    def job_titles_for(company)
      map_collection_for(company.job_titles.active, :job_title_name)
    end

    def categories_for(company)
      map_collection_for(company.categories.active, :category_name)
    end
  end
end
