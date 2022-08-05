class BookCategory < ApplicationRecord
  paginates_per 10
  acts_as_paranoid

  validates :book_id, presence: true
  validates :genre_id, presence: true
end
