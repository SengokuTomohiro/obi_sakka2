class Catchcopy < ApplicationRecord  
    belongs_to :book
    default_scope -> { order(created_at: :desc) }
end
