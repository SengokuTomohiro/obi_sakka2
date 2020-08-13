class Catchcopy < ApplicationRecord  
    belongs_to :book

    def book
        return Book.find_by(id: self.book_id)
     end
end
