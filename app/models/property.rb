class Property < ApplicationRecord
  belongs_to :user
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description, :location, :category, :theme ],
    using: {
      tsearch: { prefix: true }
    }
end
