class Book < ApplicationRecord 
    has_many :books, dependent: :destroy
end
