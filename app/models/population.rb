class Population < ApplicationRecord

    # Methods
    def self.select2(q)
        select_scope = "id, type_population"
        where_scope = "LOWER(type_population) LIKE '%#{q.downcase}%'"
        select(select_scope).where(where_scope)
    end
end
