class Book < ApplicationRecord 
    has_many :catchcopies, dependent: :destroy, foreign_key: :book_id
end
