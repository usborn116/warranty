module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        def filter(filtering_params)
            results = self.where(nil)
            filtering_params.each do |k, v|
                results = results.public_send("filter_by_#{k}", v) if v.present?
            end
            results
        end
    end
end