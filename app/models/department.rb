class Department < ApplicationRecord
    has_many :items, dependent: :destroy

    # Validation
end
