class Borrower < ApplicationRecord
    paginates_per 10
    acts_as_paranoid
  
    validates :book_id, presence: true
    validates :member_id, presence: true
end
